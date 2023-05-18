#!/bin/bash
apt-get update
curl -L -o hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.tar.gz
tar xzf hugo.tar.gz hugo
mv hugo /usr/local/bin/
apt-get install -y hugo make
make build