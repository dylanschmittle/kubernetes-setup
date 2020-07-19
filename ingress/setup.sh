#!/bin/sh
kubectl create namespace cert-manager
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v0.15.1 \
  --set installCRDs=true
kubectl apply -f certs.yaml -n cert-manager
kubectl apply -f ingress.yaml -n kube-system
