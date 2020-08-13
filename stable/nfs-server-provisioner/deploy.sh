#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

helm install nfs-server-provisioner ./ --set persistence.enabled=true,persistence.size=10Gi
