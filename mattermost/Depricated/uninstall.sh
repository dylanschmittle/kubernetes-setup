#!/bin/sh
echo "Deleting Kube Objects" &
#kubectl delete ClusterInstallation -n mattermost my-mattermost
kubectl delete -f mattermost.yaml -n mattermost &
kubectl delete -f minio-operator.yaml -n minio-operator &
kubectl delete -f mysql-operator.yaml -n mysql-operator &
kubectl delete -f mattermost-operator.yaml -n mattermost-operator &
# TODO: Scoop up created objects from create output and add to a delete script
echo "Deleting Namespaces" &
kubectl delete ns mattermost &
kubectl delete ns mattermost-operator &
kubectl delete ns minio-operator &
kubectl delete ns mysql-operator
#echo "Run setup.sh to generate new manifests and install them"
echo "Hanging Resources"
kubectl get all -A | grep -i mattermost > missed-resources.log
kubectl get all -A | grep -i minio >> missed-resources.log
kubectl get all -A | grep -i mysql >> missed-resources.log
cat missed-resources.log
