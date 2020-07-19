#!/bin/sh
mkdir -p ~/.jitsi-meet-cfg/{web/letsencrypt,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}
kompose convert && mkdir charts
kompose convert -f etherpad.yml
kompose convert -f jigasi.yml
mv *.yaml charts
kubectl create ns jitsi-meet && kubens jitsi-meet
kubectl create configmap my-config --from-file=.env
kubectl get configmaps my-config -o yaml > charts/configmap.yaml
cp .env charts/.env
cp *.yml charts
mv charts ../charts
echo "add ingress's and certs to match the compose file, and set DNS A Records"
echo "Fix Volumes for ~/.jitsi-meet-cfg/{web/letsencrypt,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}"
cd ..
mv docker-jitsi-meet /tmp/docker-jitsi-meet