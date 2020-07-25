#!/bin/sh
kubectl create ns kubevirt
kubectl create ns cdi
kubectl apply -n kubevirt -f virt
kubectl apply -n cdi -f cdi
