#!//bin/bash

ldd  /bin/openssl /bin/cp /bin/dash /bin/bash \
       | sed -e "s/(.*)//g" -e "s/^[ \t]*//g" \
       | grep -v "^.*:" \
       | sort -u
