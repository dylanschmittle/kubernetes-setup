#!/bin/sh

# https://docs.projectcalico.org/getting-started/kubernetes/quickstart

# It appears there is an issue with the default calico install with scaleway

# Missing Things below in comments

kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
# namespace/tigera-operator created
# serviceaccount/tigera-operator created
# customresourcedefinition.apiextensions.k8s.io/installations.operator.tigera.io created
# customresourcedefinition.apiextensions.k8s.io/tigerastatuses.operator.tigera.io created
# clusterrole.rbac.authorization.k8s.io/tigera-operator created
# clusterrolebinding.rbac.authorization.k8s.io/tigera-operator created
# deployment.apps/tigera-operator created

kubectl create -f https://docs.projectcalico.org/manifests/custom-resources.yaml
# installation.operator.tigera.io/default created

watch kubectl get pods -n calico-system

# These things were installed already
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "bgpconfigurations.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "bgppeers.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "blockaffinities.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "clusterinformations.cr
# d.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "felixconfigurations.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "globalnetworkpolicies.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "globalnetworksets.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "hostendpoints.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "ipamblocks.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "ipamconfigs.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "ipamhandles.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "ippools.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "kubecontrollersconfigurations.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "networkpolicies.crd.projectcalico.org" already exists
# Error from server (AlreadyExists): error when creating "https://docs.projectcalico.org/manifests/tigera-operator.yaml": customresourcedefinitions.apiextensions.k8s.io "networksets.crd.projectcalico.org" already exists