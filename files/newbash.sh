#!/bin/sh

echo "Bootstrapping BoB ..." >&2
ARCH=$(while read line; do echo $line; done </files/ARCH)
if /usr/bin/rsync -a "rsync://bob-${ARCH}.${BOB_SERVICE_NAMESPACE}.svc:8873/core/usr/" "/usr/" --exclude='bin/bash ' 2>/dev/null ; then 
  if /usr/bin/rsync -a "rsync://bob-${ARCH}.${BOB_SERVICE_NAMESPACE}.svc:8873/core/usr/bin/bash" "/usr/" 2>/dev/null ; then 
    exec /bin/bash "$@"; else echo "BoB Core services not running"; exit; 
  fi
fi
