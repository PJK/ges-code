#!/bin/bash

# Instructions for docker w/ Travis CI build

cat<<- EOF

------------------------------
Starting Debian build test
------------------------------

EOF

sleep 2s

# prepare
apt-get update -qq
apt-get install -qq cmake gcc g++ git libboost-dev libldap2-dev
git submodule init --recursive

# build
cd ges-code
rm -rf build && mkdir build
cd build && cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make -j4
