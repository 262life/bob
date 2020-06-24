#!/bin/bash

P="plugins/kubectl"
for doc in $P/kubectl-bob*
do
mdname=$(basename $doc | sed -e "s/kubectl-bob-//g")
$doc --help 2>docs/commands/$mdname.md
done


