#!/bin/bash -x


CV=$(cat VERSION)
echo Version: $CV
pwd

cd plugins/kubectl

sed -i .bak  -e "s/^echo.*$/echo 'version: $CV'/g" kubectl-bob-version

