#!/bin/bash 


CV=$(cat VERSION)
echo Version: $CV

if echo "$OSTYPE" | grep -q 'darwin' ; then sedopts='-i .bak'; else sedopts='-i'; fi


sed ${sedopts} -e "1 s/v.*$/$CV)/g" README.md

