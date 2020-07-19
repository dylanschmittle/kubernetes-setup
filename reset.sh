#!/bin/sh
if [ ! -e tmp ]; then
  echo "Using existing tmp folder"
else
  mkdir tmp
fi
echo "Archiving Operator Manifests. Resetting Domain, Moving Logs"
TIME=$(date +%s)
mkdir old-$(TIME)
mv *-operator.yaml old-$(TIME)/
cp mattermost.yaml old-$(TIME)/mattermost.yaml.old
echo "Resetting Domain to mm.example.com in mattermost.yaml"
OLD_DOMAIN=$(cat mattermost.yaml| grep ingressName | cut -d":" -f2 | awk '{print $1, $2}')
sed -i "s/$OLD_DOMAIN/mm.example.com/g" mattermost.yaml

mkdir tmp/$(echo $TIME) && mv *.log tmp/$(echo $TIME)
echo "Moved old manifests to tmp/$TIME"