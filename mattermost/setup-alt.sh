#!/bin/sh
echo "NGINX + Cilium Cluster based install starting"
# https://docs.mattermost.com/install/install-kubernetes.html
kubectl create ns mysql-operator
kubectl apply -n mysql-operator -f https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/mysql-operator/mysql-operator.yaml
kubectl create ns minio-operator
kubectl apply -n minio-operator -f https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/minio-operator/minio-operator.yaml
kubectl create ns mattermost-operator
kubectl apply -n mattermost-operator -f https://raw.githubusercontent.com/mattermost/mattermost-operator/master/docs/mattermost-operator/mattermost-operator.yaml
kubectl create ns mattermost
cat mattermost-template.yaml > mattermost-nginx.yaml
sed -i "s/mm.example.com/mm.92c62c91-7a4e-4dfb-8e6e-a062063a70ae.nodes.k8s.fr-par.scw.cloud/g" mattermost-nginx.yaml
sed -i "s/traefik/nginx/g" mattermost-nginx.yaml
kubectl apply -n mattermost -f mattermost-nginx.yaml
cd ../cert-manager && sh setup.sh