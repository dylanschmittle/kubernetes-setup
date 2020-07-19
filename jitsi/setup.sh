#!/bin/sh
git clone https://github.com/schul-cloud/jitsi-deployment
cd jitsi-deployment/overlays/prouction
kustomize build . | kubectl apply -f -
