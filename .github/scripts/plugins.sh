#!/bin/bash 


CV=$(cat VERSION)
echo Version: $CV

if echo "$OSTYPE" | grep -q 'darwin' ; then sedopts='-i .bak'; else sedopts='-i'; fi

cd plugins/kubectl || exit

sed ${sedopts} -e "s/^echo.*$/echo 'version: $CV'/g" kubectl-bob-version
sed ${sedopts} -e "s/bob-lowcarb:.*$/bob-lowcarb:$CV/g" kubectl-bob

echo result:
echo "kubectl-bob-version: $(grep 'version:' kubectl-bob-version)"
echo "kubectl-bob bob    : $(grep 'bob-lowcarb:' kubectl-bob)"
echo "kubectl-bob proxy  : $(grep 'bob-bootstrap:' kubectl-bob)"

