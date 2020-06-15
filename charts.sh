#!/bin/sh

CV=$(cat VERSION)
echo Version: $CV

cd helm

sed -ie "s/^version.*$/version: $CV/g" chart/Chart.yaml
  
for chart in chart
do
  echo Processing: $chart
  helm lint $chart
  helm package $chart
done

helm repo index --url https://BobDotMe.github.io/bob . 2>/dev/null

mv index.yaml ../docs/.
mv *.tgz ../docs/.

cd ..

