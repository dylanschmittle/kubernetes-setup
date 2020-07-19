#!/bin/sh
# https://blog.levine.sh/14058/wireguard-on-k8s-road-warrior-style-vpn-server
kubectl delete ns wireguard
kubectl create ns wireguard && kubens wireguard
kubectl apply -f charts -n wireguard

kubectl -n wireguard create secret generic wg0-key --from-file=wg0.key=./privateB.key
