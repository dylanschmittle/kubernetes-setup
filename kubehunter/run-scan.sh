#!/bin/sh
kubens $1
kubectl create -f job.yaml
