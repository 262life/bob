#!/bin/sh

CV=$(cat VERSION)
echo Version: $CV

cd plugins/kubectl

sed -i .bak  -e "s/^version.*$/version: $CV/g" kubectl-bob-version

