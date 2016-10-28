#!/bin/bash

# Instructions for docker w/ Travis CI build

cat<<- EOF

------------------------------
Starting Ubuntu build test
------------------------------

EOF

sleep 2s
ls
pwd
apt-get update -qq
apt-get install -yqq cmake libboost-dev libc6-dev git
git submodule update --init
rm -rf build && mkdir build
cd build && cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make -j4
