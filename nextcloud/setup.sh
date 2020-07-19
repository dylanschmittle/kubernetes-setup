kubectl create ns nextcloud && kubens nextcloud
helm install --name nextcloud stable/nextcloud -g
export APP_HOST=127.0.0.1
export APP_PASSWORD=$(kubectl get secret --namespace nextcloud nextcloud -o jsonpath="{.data.nextcloud-password}" | base64 --decode)
## PLEASE UPDATE THE EXTERNAL DATABASE CONNECTION PARAMETERS IN THE FOLLOWING COMMAND AS NEEDED ##
helm upgrade nextcloud stable/nextcloud --set nextcloud.password=$APP_PASSWORD,nextcloud.host=$APP_HOST,service.type=ClusterIP,mariadb.enabled=true
"export POD_NAME=$(kubectl get pods --namespace nextcloud -l "app=nextcloud-1595196156" -o jsonpath="{.items[0].metadata.name}")
echo http://127.0.0.1:8080/
kubectl port-forward $POD_NAME 8080:8080"