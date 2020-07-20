#!/bin/sh
kubectl apply -f vm-templates/fedora-vm.yaml
virtctl console fedora
