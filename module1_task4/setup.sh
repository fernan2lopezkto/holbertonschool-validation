#!/bin/bash

apt-get update

apt-get install -y make

wget https://github.com/gohugoio/hugo/releases/download/v0.79.0/hugo_0.79.0_Linux-64bit.deb

dpkg -i hugo_0.79.0_Linux-64bit.deb

make build

exit 0