#!/bin/sh -eu
trap : TERM INT; (while true; do sleep 1000; done) &

echo ":${MY_POD_NAME}:"
while true
do
  case "${MY_POD_NAME}" in
    "bob-bootstrap"*) echo "Bob Services loaded...." >&2;
                      rm /usr/bin/dash-x 2>/dev/null;
                      rm /bin/bash-x 2>/dev/null;;
    *)                if /usr/bin/rsync -a "rsync://bob.${BOB_SERVICE_NAMESPACE}.svc:8873/core/usr/" "/usr/" ; then exit; fi;
                      sleep 2;;
  esac

done


