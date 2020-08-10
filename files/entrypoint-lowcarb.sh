#!/bin/sh -eu
trap : TERM INT; (while true; do sleep 1000; done) &

while true
do
  case "${MY_POD_NAME}" in
    "bob-bootstrap"*) echo "Bob Services loaded for '${MY_POD_NAME}'...." >&2;
                      rm /usr/bin/dash-x 2>/dev/null;
                      rm /bin/bash-x 2>/dev/null;;
    *)                echo "Bootstrapping BoB for '${MY_POD_NAME}'...." >&2; 
                      if /usr/bin/rsync -a "rsync://bob.${BOB_SERVICE_NAMESPACE}.svc:8873/core/usr/" "/usr/" ; then exit; fi;
                      sleep 2;;
  esac

done


