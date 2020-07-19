#!/bin/sh
TIME=$(date +%s)
sh status.sh > pre-uninstall-status.log
echo $(kubectl get all --all-namespaces) >> pre-uninstall-objects-$(TIME).log
echo "Deleting Kube Objects"
#kubectl delete ClusterInstallation -n mattermost my-mattermost
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
rm namespaces_installed.log
#echo "Run setup.sh to generate new manifests and install them"
echo "sleep for 2 min to allow time for objects to delete"
sleep 120
echo $(kubectl get all --all-namespaces) >> post-uninstall-objects-$(TIME).log
echo "Check remaining-objects.txt for any hanging resources, full list of installed objects at installlog*.txt"
sh status.sh > post-uninstall-status.log
