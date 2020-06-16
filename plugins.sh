#!/bin/sh

CV=$(cat VERSION)
echo Version: $CV

cd plugins/kubectl

sed -i .bak  -e "s/^echo.*$/echo 'version: $CV'/g" kubectl-bob-version

