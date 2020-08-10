#!/bin/sh -eu
trap : TERM INT; (while true; do sleep 1000; done) &

echo ":${MY_NODE_NAME}:"
while true
do
  if echo "${MY_NODE_NAME}" | grep bob-bootstrap >/dev/null 2>/dev/null ;then
    echo "Bob Services loaded...." >&2
    rm /usr/bin/dash-x 2>/dev/null
    rm /bin/bash-x 2>/dev/null
  else
    if /usr/bin/rsync -a "rsync://bob.${BOB_SERVICE_NAMESPACE}.svc:8873/core/usr/" "/usr/" ; then exit; fi
    sleep 2
  fi
done


