#!/bin/sh

CV=$(cat VERSION)
echo Version: $CV

if echo "$OSTYPE" | grep -q 'darwin' ; then sedopts='-i .bak'; else sedopts='-i'; fi

cd helm

sed ${sedopts} -e "s/^version.*$/version: $CV/g" chart/Chart.yaml
sed ${sedopts} -e "s/^appVersion.*$/appVersion: $CV/g" chart/Chart.yaml
  
for chart in chart
do
  echo Helm Version: $(helm version)
  echo Processing: $chart
  helm lint $chart
  helm package $chart
done

helm repo index --url https://BobDotMe.github.io/bob . 2>/dev/null

mv index.yaml ../docs/.
mv /home/runner/work/bob/bob/helm/*.tgz ../docs/.

cd ..

