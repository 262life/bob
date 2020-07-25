#!/bin/sh

while [ "1" = "1" ]
do
  if /usr/bin/rsync -a rsync://bob.${BOB_SERVICE_NAMESPACE}.svc:8873/core/usr/ /usr-sync/ ; then exit 0; fi
  echo "Waiting for BOB core services to start..." >&2
  sleep 2
done

