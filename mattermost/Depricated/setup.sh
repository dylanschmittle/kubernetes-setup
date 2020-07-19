#!/bin/sh

export READY_CHECK=1
# 0 : lots of info from status.sh looped until ready
# 1 : info and deployment status printed once, then exit
# 2 : watch deployments util ready

# Create NS, hide output
kubectl create ns mattermost
kubectl create ns mattermost-operator
kubectl create ns minio-operator
kubectl create ns mysql-operator

echo $(kubectl get all --all-namespaces) > pre-install-objects.log
echo "Traefik and Calico Cluster based installer starting"

echo "Installing Mattermost Via Operator (MySQL MinIO Mattermost)"

echo "Setup MySQL Operator"
if [ ! -e "mysql-operator.yaml" ]; then
  wget https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/mysql-operator/mysql-operator.yaml
  echo "Changing Password and Username(using openssl and base64)"
  sed -i "s/b3JjaGVzdHJhdG9y/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1 | base64)/g" mysql-operator.yaml
  sed -i "s/YW1QZHlGN1VmRA==/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1 | base64)/g" mysql-operator.yaml
else
  echo "Using Existing MySQL Operator and Credentials"
fi
echo "Installing MySQL Operator"
kubens mysql-operator
kubectl apply -n mysql-operator -f mysql-operator.yaml -o json > installed_objects.json

echo "Setup MinIO Operator"
#kubectl create ns minio-operator
if [ ! -e "minio-operator.yaml" ]; then
  wget https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/minio-operator/minio-operator.yaml
else
  echo "Using Local MinIO Operator"
fi
echo "Installing MinIO Operator"
kubens minio-operator
kubectl apply -n minio-operator -f minio-operator.yaml -o json >> installed_objects.json

echo "Setup Mattermost Operator"
#kubectl create ns mattermost-operator
if [ ! -e "mattermost-operator.yaml" ]; then
  wget https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/mattermost-operator/mattermost-operator.yaml
else
  echo "Using Local Mattermost Operator"
fi
echo "Installing Mattermost Operator"
kubens mattermost-operator
kubectl apply -n mattermost-operator -f mattermost-operator.yaml -o json >> installed_objects.json

echo "Setup Mattermost Manifest"
if [ ! -e "mattermost.yaml" ]; then
  echo -n "Enter Domain Name (mm.example.com): "
  read DOMAIN_NAME
  cp mattermost-template.yaml mattermost.yaml
  OLD_DOMAIN=$(cat mattermost.yaml| grep ingressName | cut -d":" -f2 | awk '{print $1, $2}')
  sed -i "s/$OLD_DOMAIN/$DOMAIN_NAME/g" mattermost.yaml
else
  echo "Using Existing Mattermost Manifest/Domain $(cat mattermost.yaml| grep ingressName | cut -d":" -f2 | awk '{print $1, $2}')"
fi
echo "Install Mattermost Manifest"
kubens mattermost
kubectl apply -n mattermost -f mattermost.yaml -o json >> installed_objects.json

mv installed_objects.json post-install-objects.json

if [ $READY_CHECK -le 0 ]; then
  echo "Install Finished, Starting Ready Check (60 second loop)"
  while [ $(kubectl get deployments.apps -n mattermost | grep "my-mattermost" | awk '{print $2}' | grep 1 | cut -d "/" -f1) -le '0' ]
  do
    sh status.sh
    sleep 60
  done
  echo "Service is Ready"
else
  sh status.sh
fi

if [ $READY_CHECK -le 2 ]; then
  watch kubectl get deployments.apps -A
else
  kubectl get deployments.apps -A
fi

