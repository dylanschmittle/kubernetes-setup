#!/bin/sh
TIME=$(date +%s)

echo $(kubectl get all --all-namespaces) >> pre-uninstall-objects-$(TIME).log
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
#echo "Run setup.sh to generate new manifests and install them"
echo $(kubectl get all --all-namespaces) >> post-uninstall-objects-$(TIME).log
echo "Check remaining-objects.txt for any hanging resources, full list of installed objects at installlog*.txt"
