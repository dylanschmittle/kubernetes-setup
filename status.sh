#!/bin/sh

NAMESPACES=["mattermost", "mattermost-operator", "mysql-operator", "minio-operator"]

for ns in "${NAMESPACES[@]}"
do
   : 
	echo "--Status Check--"
	echo $i
	echo "  Objects: "
	kubectl -n $ns get all -o wide
	echo "  Deployments: "
	kubectl get deployments.apps -n $ns
	echo "  Events: "
	kubectl get events -n $ns
done