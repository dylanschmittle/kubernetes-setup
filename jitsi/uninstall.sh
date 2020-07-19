#!/bin/sh
cd jitsi-deployment/overlays/prouction
kustomize build . | kubectl delete -f -
