#!/bin/bash

# Instructions for docker w/ Travis CI build

cat<<- EOF

------------------------------
Starting Ubuntu build test
------------------------------

EOF

sleep 2s

# prepare
apt-get update -qq
apt-get install -qq cmake libboost-dev libc6-dev git
git submodule update --init

# build
cd ges
rm -rf build && mkdir build
cd build && cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make -j4
