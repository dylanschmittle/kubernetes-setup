### Idempotent Mattermost Install via Operators In kubernetes

This Installs a small 100person mattermost server without elasticsearch

BROKEN: This Assumes your are using traefik as your egress
BROKEN: Tested on 1.18 Manged Kube from scaleway with calico-cni and traefik2

## USE Alt install with cilium and nginx, it works out of the box

Setup will ask you for a domain, and generate mysql passwords that are inserted into the manifest. If You change domains without running the reset, you must manually edit the mattermost.yaml file and rerun setup. 

[Calico](https://docs.projectcalico.org/getting-started/kubernetes/quickstart)
[Scaleway](https://developers.scaleway.com/en/products/k8s/api/)
[Refrence Used](https://docs.mattermost.com/install/install-kubernetes-operator.html)

Make sure calico is working before you proceed, Calico Was missing some CRDS, install them with this
```sh
kubectl get pods -n calico-system
```
Verify Traefik and all of kube-system is ready
```sh
kubectl --namespace=kube-system get pods
kubectl get events -n kube-system
```
To Install/Apply Changes. Operator Manifests will be pulled if they are not present, make any changes, and run setup again to apply the changes.
```sh
./setup.sh
```
To Uninstall
```sh
./uninstall.sh
```
To Reset/Remove Locally Loaded Operator Manifests
```sh
./reset.sh
```
To Check the Status of An install
```sh
./status.sh
```

Alternate NGINX Baremetal Nodeport Install
```sh
./setup-alt.sh
