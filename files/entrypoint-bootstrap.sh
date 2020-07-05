#!/bin/sh

while [ "1" = "1" ]
do
  if rsync -a rsync://bob.bob.svc:8873/core/usr/ /usr-sync/; then exit 0; fi
  echo "Waiting for BOB core services to start
  sleep 1
done

