# Cluster Setup
1.) Install A Scaleway Kubernetes Cluster with Cilium and No Ingress
2.) Download the kubeconfig, and authenticate with the cluster
3.) Setup DNS to Point to Cluster's IP (if your just 1 node)
4.) Change DNS names in ingress/cert-manager to what you need
4.) Install Tools (~15 min)
  * Mattermost + TLS
  * Kubevirt + VNC
  * OpenVPN (Can See Kube Services Without Exposing to Internet + No Load Balancer is Used)
  * IRC Server (via port forward or VPN)
```sh
./bootstrap.sh
```
