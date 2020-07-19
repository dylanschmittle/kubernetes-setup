#!/bin/sh
kubens kube-system && helm uninstall kube-hunter-1595195150
kubectl -n kube-system delete job -l app=kube-hunter,release=kube-hunter-1595195150