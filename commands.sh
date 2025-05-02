#!/bin/bash

kind create cluster --name multi-node --config kind-multi-node.yaml

kubectl get pods -n kube-system

kind delete cluster --name multi-node
