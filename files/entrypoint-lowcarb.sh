#!/bin/sh 

while true
do
  case "${MY_POD_NAME}" in
    "bob-bootstrap"*) echo "BoB Services loaded for '${MY_POD_NAME}'...." >&2;
                      rm /usr/bin/dash 2>/dev/null;
                      rm /bin/bash 2>/dev/null;
                      break;;
    *)                echo "Bootstrapping BoB for '${MY_POD_NAME}'...." >&2; 
                      if /usr/bin/rsync -a "rsync://bob.${BOB_SERVICE_NAMESPACE}.svc:8873/core/usr/" "/usr/" ; then break; fi;
                      sleep 2;;
  esac
done
trap : TERM INT; (while true; do sleep 1000; done)