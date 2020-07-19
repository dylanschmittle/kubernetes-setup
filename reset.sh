#!/bin/sh
echo "Deleting Operator Manifests"
rm mattermost-operator.yaml
rm minio-operator.yaml
rm mysql-operator.yaml
echo "Resetting Domain to mm.example.com in mattermost.yaml"
OLD_DOMAIN=$(cat setup.sh | grep "DOMAIN_NAME" | cut -d "\"" -f2)
sed -i "s/$OLD_DOMAIN/mm.example.com/g" mattermost.yaml

