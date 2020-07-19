#!/bin/sh
echo "Ready Check of Mattermost: "
kubectl -n mattermost get all -o wide
echo "Deployment status for Entire Cluster: "
kubectl get deployments.apps -A
echo "Events: "
kubectl get events -A
