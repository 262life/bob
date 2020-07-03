#!/bin/bash

# This creates helpdocs

echo "# BOB plugins" > docs/commands.md
echo ""             >> docs/commands.md

P="plugins/kubectl"
for doc in $P/kubectl-bob*
do
  mdname=$(basename $doc | sed -e "s/kubectl-bob-//g")
  if [ "$mdname" = "kubectl-bob" ];then mdname=bob; fi
  $doc --help 2>docs/commands/$mdname.md
  echo "[$mdname](commands/$mdname.md)" >> docs/commands.md
done
