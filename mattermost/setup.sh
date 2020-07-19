#!/bin/sh

# Set to 1 to disable check
export READY_CHECK=1

# Create NS, hide output
kubectl create ns mattermost >> /dev/null 2>&1
kubectl create ns mattermost-operator >> /dev/null 2>&1
kubectl create ns minio-operator >> /dev/null 2>&1
kubectl create ns mysql-operator >> /dev/null 2>&1

echo $(kubectl get all --all-namespaces) > pre-install-objects.log

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
kubectl apply -n mysql-operator -f mysql-operator.yaml -o json > installed_objects.json

echo "Setup MinIO Operator"
#kubectl create ns minio-operator
if [ ! -e "minio-operator.yaml" ]; then
  wget https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/minio-operator/minio-operator.yaml
else
  echo "Using Local MinIO Operator"
fi
echo "Installing MinIO Operator"
kubectl apply -n minio-operator -f minio-operator.yaml -o json >> installed_objects.json

echo "Setup Mattermost Operator"
#kubectl create ns mattermost-operator
if [ ! -e "mattermost-operator.yaml" ]; then
  wget https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/mattermost-operator/mattermost-operator.yaml
else
  echo "Using Local Mattermost Operator"
fi
echo "Installing Mattermost Operator"
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
  echo "Install Finished, Ready Check Skipped run status.sh manually"
fi
