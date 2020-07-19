#!/bin/sh
echo "Deleting Kube Objects"
kubectl delete -f mattermost.yaml
kubectl delete -f minio-operator.yaml
kubectl delete -f mysql-operator.yaml
kubectl delete -f mattermost-operator.yaml
# TODO: Scoop up created objects from create output and add to a delete script
echo "Deleting Namespaces"
kubectl delete ns mattermost
kubectl delete ns mattermost-operator
kubectl delete ns minio-operator
kubectl delete ns mysql-operator
#echo "Deleting Operator Manifests"
#rm *-operator.yaml
#echo "Run setup.sh to generate new manifests and install them"

