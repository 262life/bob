#!/bin/bash 


CV=$(cat VERSION)
echo Version: $CV

if echo "$OSTYPE" | grep -q 'darwin' ; then sedopts='-i .bak'; else sedopts='-i'; fi

cd plugins/kubectl

sed ${sedopts} -e "s/^echo.*$/echo 'version: $CV'/g" kubectl-bob-version
sed ${sedopts} -e "s/bob:.*$/bob:$CV/g" kubectl-bob
sed ${sedopts} -e "s/bob-proxy:.*/bob-proxy:$CV/g" kubectl-bob

echo result:
echo kubectl-bob-version: $(cat kubectl-bob-version | grep 'version:')
echo kubectl-bob bob    : $(cat kubectl-bob | grep 'bob:')
echo kubectl-bob proxy  : $(cat kubectl-bob | grep 'bob-proxy:')

