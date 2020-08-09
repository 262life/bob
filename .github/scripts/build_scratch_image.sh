#!/bin/bash

docker pull ubuntu:focal

mkdir -p distro/pre-work

chmod 755 .github/scripts/init.sh 
LATEST=false TAG=interim NOPUBLISH=true DOCKERFILE=dockerfiles/Dockerfile-core-prework .github/scripts/init.sh bob-pre-work

docker save -o distro/pre-work/latest-focal.tar bob-pre-work:interim
mkdir -p distro/pre-work/extract
.github/scripts/extract_image.py distro/pre-work/latest-focal.tar distro/pre-work/extract
cd distro/pre-work/extract 
rm -rf work
tar zcvf ../../ubuntu-focal-latest.tar.gz *
cd ../../..
rm -rf distro/pre-work

