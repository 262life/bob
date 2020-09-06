#!/bin/bash 


CV=$(cat VERSION)
echo Version: $CV

if echo "$OSTYPE" | grep -q 'darwin' ; then sedopts='-i .bak'; else sedopts='-i'; fi

cd plugins/kubectl || exit

sed ${sedopts} -e "s/^echo.*$/echo 'version: $CV'/g" kubectl-bob-version
sed ${sedopts} -e "s/CURRENT_VERSION=.*$/CURRENT_VERSION=\"bobdotme\/bob-lowcarb:$CV\"/g" kubectl-bob

echo result:
echo "kubectl-bob-version: $(grep 'version:' kubectl-bob-version)"
echo "kubectl-bob bob    : $(grep '="bob-lowcarb:' kubectl-bob)"
