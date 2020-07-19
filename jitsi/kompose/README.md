### WIP: Convert Working docker-compose from jitsi to kube
https://github.com/jitsi/docker-jitsi-meet

``` sh
./env-gen.sh
```
Set .env file values
Derefrence all non environment vars in compose files
``` sh
./convert.sh
```
TODO: Fix Volumes
TODO: Add DNS entry to ingress and certs and set on namecheap

### These are broken

### Helm nil pointer error
https://github.com/taktakpeops/jitsi-meet-helm

### Broken, node tainsts and some failed manifest installs
https://github.com/jefferyb/k8s-jitsi-meet

### Need to figure out the docker ip env 
https://github.com/schul-cloud/jitsi-deployment