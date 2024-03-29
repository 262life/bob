#!/bin/sh 

while true
do
  case "${MY_POD_NAME}" in
    "bob-bootstrap"*) echo "BoB Services loaded for '${MY_POD_NAME}'...." >&2;
                      rm /usr/bin/dash 2>/dev/null;
                      rm /bin/bash 2>/dev/null;
                      break;;
    *)                echo "Bootstrapping BoB for '${MY_POD_NAME}'...." >&2; 
                      ARCH=$(while read line; do echo $line; done </files/ARCH)
                      if /usr/bin/rsync -a "rsync://bob-${ARCH}.${BOB_SERVICE_NAMESPACE}.svc:8873/core/usr/" "/usr/" --exclude bin/bash 2>/dev/null ; then
                        if /usr/bin/rsync -a "rsync://bob-${ARCH}.${BOB_SERVICE_NAMESPACE}.svc:8873/core/usr/bin/bash" "/usr/" 2>/dev/null ; then break; else echo "Retrying BoB..."; fi;
                      else 
                        echo "Retrying BoB..."; 
                      fi;

                      sleep 2;;
  esac
done
rm -rf /app 2>/dev/null
trap : TERM INT; (while true; do sleep 1000; done)
