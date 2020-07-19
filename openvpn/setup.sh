#!/bin/sh
#kubectl delete -f openvpn.yaml && kubectl delete ns openvpn
RELEASE=myvpn
NAMESPACE=openvpn
kubectl create ns $NAMESPACE && kubens $NAMESPACE
helm template stable/openvpn --generate-name --name-template=$RELEASE > openvpn.yaml
sed -i "s/2M/1G/g" openvpn.yaml
kubectl apply -f openvpn.yaml
watch kubectl get events
POD_NAME=$(kubectl get pods -l "app=openvpn,release=$RELEASE" -o jsonpath='{.items[0].metadata.name}') \
&& kubectl logs "$POD_NAME" --follow

