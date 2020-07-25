echo "Deleting Namespaces"
kubectl delete ns mattermost
kubectl delete ns mattermost-operator
kubectl delete ns minio-operator
kubectl delete ns mysql-operator
#echo "Run setup.sh to generate new manifests and install them"
echo "Hanging Resources"
kubectl get all -A | grep -i mattermost
kubectl get all -A | grep -i minio
kubectl get all -A | grep -i mysql

