#!/bin/bash 


CV=$(cat VERSION)
echo Version: $CV

if echo "$OSTYPE" | grep -q 'darwin' ; then sedopts='-i .bak'; else sedopts='-i'; fi

cd plugins/kubectl

sed ${sedopts} -e "s/^echo.*$/echo 'version: $CV'/g" kubectl-bob-version
sed ${sedopts} -e "s/^bob:.*$/echo 'bob:$CV'/g" kubectl-bob-version
sed ${sedopts} -e "s/^bob-proxy:.*$/echo 'bob-proxy:$CV'/g" kubectl-bob-version

echo result:
cat kubectl-bob-version

