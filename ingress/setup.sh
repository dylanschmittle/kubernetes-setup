#!/bin/sh
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install cert-manager jetstack/cert-manager --create-namespace --namespace cert-manager --version v0.15.1 --set installCRDs=true
helm install -n nginx-ingress --create-namespace my-release ingress-nginx/ingress-nginx

kubectl apply -f charts/nginx.yaml
#kubectl apply -f charts/istio.yaml