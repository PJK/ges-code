#!/bin/bash

# Instructions for docker w/ Travis CI build

sleep 2s

######################
# prepare
######################

apt-get update -qq
apt-get install -qq cmake gcc g++ git libboost-dev libldap2-dev
git submodule init --recursive

######################
# build
######################

cat<<- EOF

-------------------------------------
Starting build for Ubuntu
-------------------------------------

EOF

cd ges-code
rm -rf build && mkdir build
cd build && cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make VERBOSE=1 -j4
