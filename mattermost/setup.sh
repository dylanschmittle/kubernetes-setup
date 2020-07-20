#!/bin/sh
echo "NGINX + Cilium Cluster based install starting"
# https://docs.mattermost.com/install/install-kubernetes.html
kubectl create ns mysql-operator
kubectl apply -n mysql-operator -f https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/mysql-operator/mysql-operator.yaml
kubectl create ns minio-operator
kubectl apply -n minio-operator -f https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/minio-operator/minio-operator.yaml
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install -n nginx-ingress --create-namespace my-release ingress-nginx/ingress-nginx
kubectl create ns mattermost-operator
kubectl apply -n mattermost-operator -f https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/mattermost-operator/mattermost-operator.yaml
kubectl create ns mattermost
kubectl apply -n mattermost -f mattermost-nginx.yaml
