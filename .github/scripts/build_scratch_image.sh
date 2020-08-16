#!/bin/bash

docker pull ubuntu:focal

mkdir -p distro/pre-work

chmod 755 .github/scripts/init.sh 
LATEST=false TAG=interim PUBLISH=false DOCKERFILE=dockerfiles/Dockerfile-core-prework .github/scripts/init.sh bob-pre-work

docker save -o distro/pre-work/latest-focal.tar bob-pre-work:interim
mkdir -p distro/pre-work/extract
sudo .github/scripts/extract_image.py distro/pre-work/latest-focal.tar distro/pre-work/extract
cd distro/pre-work/extract || exit
sudo rm -rf work
sudo tar zcf ../../ubuntu-focal-latest.tar.gz ./*
cd ../../..
sudo rm -rf distro/pre-work

