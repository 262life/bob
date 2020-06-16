#!/bin/bash 


CV=$(cat VERSION)
echo Version: $CV

if grep "darwin" <<< "$OSTYPE"; then sedopts='-i .bak'; else sedopts='-i'; fi

cd plugins/kubectl

sed ${sedopts} -e "s/^echo.*$/echo 'version: $CV'/g" kubectl-bob-version

