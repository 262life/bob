#!/bin/bash

VERSION=${1:-none}
DESTPATH=${2:-/usr/local/bin}
SERVICENAMESPACE=${3:-bob}

if [ ${VERSION} == 'none' ]; then
    echo "========================================================="
    echo "Help:"
    echo ""
    echo "This installer will pull the appropriate plugin from the "
    echo "github site and install it to /usr/local/bin"
    echo ""
    echo "You must pass a value for the VERSION like this:"
    echo "$ ./installer.sh semantic_version"
    echo ""
    echo "You can also choose add a Different destination but make"
    echo "sure it's on your path"
    echo "$ ./init.sh semantic_version new_path"
    echo ""
    echo ""
    exit
  fi


echo "Installing to: ${DESTPATH}"


cd ${DESTPATH}

curl --location --silent -o - https://github.com/BobDotMe/bob/releases/download/${VERSION}/bob-plugins-${VERSION}.tgz | 
sudo tar zxvf - && sudo chmod 755 kubectl-b* kb-bob-*
sudo bash -c "echo ${SERVICENAMESPACE} > kb-service-properties"




