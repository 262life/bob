#!/bin/bash 


CV=$(cat VERSION)
echo Version: "$CV"

if echo "$OSTYPE" | grep -q 'darwin' ; then sedopts='-i .bak'; else sedopts='-i'; fi

sed ${sedopts} -e "s/release\/v.*?/release\/$CV\?/g" README.md
sed ${sedopts} -e "s/build\%20v.*/build%20$CV)/g" README.md


