#!/bin/sh

echo "Bootstrapping BoB ..." >&2
if /usr/bin/rsync -a "rsync://bob.${BOB_SERVICE_NAMESPACE}.svc:8873/core/usr/" "/usr/" 2>/dev/null ; then exec /bin/bash "$@"; else echo "BoB Core services not running"; exit; fi
