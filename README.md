### Idempotent Mattermost Install via Operators In kubernetes

This Installs a small 100person mattermost server without elasticsearch

This Assumes your are using traefik as your egress

Tested on 1.18 Manged Kube from scaleway with calico-cni and traefik2

Setup will ask you for a domain, and generate mysql passwords that are inserted into the manifest. If You change domains without running the reset, you must manually edit the mattermost.yaml file and rerun setup. 

TODO: Parse installed objects and turn into a proper delete script

[Refrence Used](https://www.tauceti.blog/post/installing-mattermost-messaging-on-kubernetes/)

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
