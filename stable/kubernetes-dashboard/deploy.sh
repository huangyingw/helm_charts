#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

helm uninstall kubernetes-dashboard
helm install kubernetes-dashboard ./ --namespace kube-system

export NODE_PORT=$(kubectl get -n kube-system -o jsonpath="{.spec.ports[0].nodePort}" services kubernetes-dashboard)
export NODE_IP=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")
echo https://$NODE_IP:$NODE_PORT/
