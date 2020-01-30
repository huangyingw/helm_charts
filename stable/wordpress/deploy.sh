#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

#helm dependency update ./
helm uninstall wordpress
helm install wordpress ./
