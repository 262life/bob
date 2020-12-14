#!/bin/bash

CV=$(cat VERSION)
echo Version: $CV

if echo "$OSTYPE" | grep -q 'darwin' ; then sedopts='-i .bak'; else sedopts='-i'; fi
if echo "$OSTYPE" | grep -q 'darwin' ; then helmver='helm3'; else helmver='helm'; fi
if echo "$OSTYPE" | grep -q 'darwin' ; then loc="${HOME}/projects/bob/helm"; else loc='/home/runner/work/bob/bob/helm'; fi

cd helm || exit

sed ${sedopts} -e "s/^version.*$/version: $CV/g" chart/Chart.yaml
sed ${sedopts} -e "s/version: .*$/version: $CV/g" chart/values.yaml
sed ${sedopts} -e "s/^appVersion.*$/appVersion: $CV/g" chart/Chart.yaml
  
for chart in ./chart
do
  echo "Helm Version: $(helm version)"
  echo "Processing: $chart"
  "${helmver}" lint "$chart"
  "${helmver}" package "$chart"
done

mv ${loc}/*.tgz repo/.

cd .. || exit

"${helmver}" repo index --url https://BobDotMe.github.io/bob helm/repo 2>/dev/null


