#!/bin/sh
#kubectl delete -f openvpn.yaml && kubectl delete ns openvpn
export RELEASE=myvpn
export NAMESPACE=openvpn
kubectl create ns $NAMESPACE && kubens $NAMESPACE
helm template stable/openvpn --generate-name --name-template=$RELEASE > ovpn.yaml && sed -i "s/2M/1G/g" ovpn.yaml && kubectl apply -f ovpn.yaml
# watch kubectl get events
# POD_NAME=$(kubectl get pods -l "app=openvpn,release=$RELEASE" -o jsonpath='{.items[0].metadata.name}') \
# && kubectl logs "$POD_NAME" --follow

# # https://hub.helm.sh/charts/stable/openvpn