#!/bin/sh

# https://medium.com/kubernetes-tutorials/deploying-traefik-as-ingress-controller-for-your-kubernetes-cluster-b03a0672ae0c

# Create RBAC for Traefik
kubectl apply -f traefik-rbac.yaml -o json > objects.json

# Create Deployment
kuebctl apply -f traefik-deployment.yaml -o json >> objects.json

# Create General+WebUI Ingress
kubectl apply -f traefik-ingress.yaml -o json >> objects.json

# Setup External Access
kubectl apply -f traefik-external-access.yaml -o json >> objects.json

# Setup Web-UI
kubectl apply -f traefik-webui-svc.yaml -o json >> objects.json

# Watch to make sure it deploys correctly
kubectl describe svc traefik-ingress-service --namespace=kube-system
kubectl describe svc traefik-web-ui --namespace=kube-system

# General Check
kubectl --namespace=kube-system get pods
kubectl get events -n kube-system
kubectl get Ingress -A