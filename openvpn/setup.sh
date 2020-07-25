#!/bin/sh
rm -rf charts && mkdir charts
kubectl create ns openvpn
# volume size was to small, workaround till i add smaller volume types
helm template stable/openvpn --generate-name --name-template=$RELEASE > charts/ovpn.yaml && sed -i "s/2M/1G/g" charts/ovpn.yaml
kubectl apply -f charts
