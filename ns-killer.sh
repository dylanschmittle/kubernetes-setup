#!/bin/sh
kubectl get namespace $1 -o json > $1.json
sed -i -e "s/\"kubernetes\"//g" $1.json
sed -i '/^$/d' $1.json
curl -k -H "Content-Type: application/json" -X PUT --data-binary @$1.json https://92c62c91-7a4e-4dfb-8e6e-a062063a70ae.api.k8s.fr-par.scw.cloud:6443/api/v1/namespaces/$1/finalize

