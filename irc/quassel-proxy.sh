#!/bin/sh
export POD_NAME=$(kubectl get pods --namespace quassel -l "app=quassel,release=quassel-1595193996" -o jsonpath="{.items[0].metadata.name}")                                                                        
echo "Visit http://127.0.0.1:4242 to use your application"                                                                                                                                                         
echo "Quassel is running at: 127.0.0.1:4242"                                                                                                                                                                       
kubectl port-forward $POD_NAME 4242:4242
