#!/bin/sh
# https://docs.mattermost.com/install/install-kubernetes.html
kubectl create ns mysql-operator
kubectl create ns minio-operator
kubectl create ns mattermost-operator
kubectl create ns mattermost

kubectl apply -n mattermost -f charts
kubectl apply -n mattermost -f nginx.yaml