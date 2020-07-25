kubectl port-forward -n cdi service/cdi-uploadproxy 8443:443 &
kubectl apply -f win2k12-dv.yaml
TOKEN=$(kubectl apply -f upload-dv-token.yaml -o="jsonpath={.status.token}")
curl -v --insecure -H "Authorization: Bearer $TOKEN" --data-binary @9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO https://localhost:8443/v1alpha1/upload-async
#virtctl image-upload --image-path 9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO --pvc-name win2k12-iso --access-mode ReadOnlyMany --pvc-size 5G --uploadproxy-url localhost:8443