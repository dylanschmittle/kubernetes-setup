#!/bin/sh
echo "Archiving Manifests"
TIME=$(date +%s)
mkdir old-$(TIME)
mv *-operator.yaml old-$(TIME)/
cp mattermost.yaml old-$(TIME)/mattermost.yaml.old
echo "Resetting Domain to mm.example.com in mattermost.yaml"
OLD_DOMAIN=$(cat setup.sh | grep "DOMAIN_NAME" | cut -d "\"" -f2)
sed -i "s/$OLD_DOMAIN/mm.example.com/g" mattermost.yaml
