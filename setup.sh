#!/bin/sh

#export DOMAIN_NAME="mm.dylanschmittle.casa"
echo -n "Enter Domain Name (mm.example.com): "
read DOMAIN_NAME

if [ ! -e namespaces_installed ]; then
  echo "previous setup detected, using existing namespaces"
else
  kubectl create ns mattermost > namespaces_installed.log
  kubectl create ns mattermost-operator >> namespaces_installed.log
  kubectl create ns minio-operator >> namespaces_installed.log
  kubectl create ns mysql-operator >> namespaces_installed.log
fi

echo $(kubectl get all --all-namespaces) > pre-install-objects.log

echo "Installing Mattermost Via Operator (MySQL MinIO Mattermost)"

echo "Setup MySQL Operator (Random Username/Password Generated if Manifest is not present)"
#kubectl create ns mysql-operator
if [ ! -e "mysql-operator.yaml" ]; then
  wget https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/mysql-operator/mysql-operator.yaml
  echo "Changing Password and Username(using openssl and base64)"
  sed -i "s/b3JjaGVzdHJhdG9y/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1 | base64)/g" mysql-operator.yaml
  sed -i "s/YW1QZHlGN1VmRA==/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1 | base64)/g" mysql-operator.yaml
else
  echo "Using Existing MySQL Operator and Credentials"
fi

echo "Installing MySQL Operator"
kubectl apply -n mysql-operator -f mysql-operator.yaml > installed_objects.txt

echo "Setup MinIO Operator"
#kubectl create ns minio-operator
if [ ! -e "minio-operator.yaml" ]; then
  wget https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/minio-operator/minio-operator.yaml
else
  echo "Using Local MinIO Operator"
fi
echo "Installing MinIO Operator"
kubectl apply -n minio-operator -f minio-operator.yaml >> installed_objects.txt

echo "Setup Mattermost Operator"
#kubectl create ns mattermost-operator
if [ ! -e "mattermost-operator.yaml" ]; then
  wget https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/mattermost-operator/mattermost-operator.yaml
else
  echo "Using Local Mattermost Operator"
fi
echo "Installing Mattermost Operator"
kubectl apply -n mattermost-operator -f mattermost-operator.yaml >> installed_objects.txt

echo "Replacing domain name in mattermost manifest"
#kubectl create ns mattermost
OLD_DOMAIN=$(cat mattermost.yaml| grep ingressName | cut -d":" -f2 | awk '{print $1, $2}')
sed -i "s/$OLD_DOMAIN/$DOMAIN_NAME/g" mattermost.yaml

echo "Installing Mattermost Manifest"
kubectl apply -n mattermost -f mattermost.yaml >> installed_objects.txt

mv installed_objects.txt post-install-objects.log

