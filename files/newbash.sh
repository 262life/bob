#!/bin/sh

echo "Bootstrapping BOB ..." >&2
if /usr/bin/rsync -a "rsync://bob.${BOB_SERVICE_NAMESPACE}.svc:8873/core/usr/" "/usr/" ; then exec /bin/bash $*; fi
