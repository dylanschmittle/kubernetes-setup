#!/bin/sh
kubectl create ns kubevirt && kubens kubevirt
kubectl apply -f kubevirt-operator.yaml
kubectl apply -f kubevirt-cr.yaml
sh cdi/cdi-setup.sh