#!/bin/sh

trap : TERM INT; (while true; do sleep 1000; done) & 
if hostname | grep bob-bootstrap >/dev/null 2>/dev/null ;then 
  rm /usr/bin/dash
  rm /bin/sh
fi

wait
