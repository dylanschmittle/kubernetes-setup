#!/bin/sh

echo "Setup MySQL Operator"
kubectl create ns mysql-operator
if [ ! -e "mysql-operator.yaml" ]; then
  wget https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/mysql-operator/mysql-operator.yaml
  echo "Changing Password and Username(using openssl and base64)"
  sed -i "s/b3JjaGVzdHJhdG9y/$(openssl rand -base64 12)/g" mysql-operator.yaml
  sed -i "s/YW1QZHlGN1VmRA==/$(openssl rand -base64 32)/g" mysql-operator.yaml
else
  echo "Using Local MySQL Operator and Credentials"
fi
echo "Installing MySQL Operator"
kubectl apply -n mysql-operator -f mysql-operator.yaml

echo "Setup MinIO Operator"
kubectl create ns minio-operator
if [ ! -e "minio-operator.yaml" ]; then
  wget https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/minio-operator/minio-operator.yaml
else
  echo "Using Local MinIO Operator"
fi
echo "Installing MinIO Operator"
kubectl apply -n minio-operator -f minio-operator.yaml

echo "Setup Mattermost Operator"
kubectl create ns mattermost-operator
if [ ! -e "mattermost-operator.yaml" ]; then
  wget https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/mattermost-operator/mattermost-operator.yaml
else
  echo "Using Local Mattermost Operator"
fi
echo "Installing Mattermost Operator"
kubectl apply -n mattermost-operator -f mattermost-operator.yaml




