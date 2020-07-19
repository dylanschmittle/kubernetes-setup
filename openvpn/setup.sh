#!/bin/sh
kubectl delete -f openvpn.yaml && kubectl delete ns openvpn
kubectl create ns openvpn && kubens openvpn
helm repo add stable http://storage.googleapis.com/kubernetes-charts
helm template stable/openvpn --generate-name --name-template=myvpn > openvpn.yaml
sed -i "s/2M/1G/g" openvpn.yaml
kubectl apply -f openvpn.yaml
watch kubectl get events