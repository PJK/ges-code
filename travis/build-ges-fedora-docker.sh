#!/bin/bash

# Instructions for docker w/ Travis CI build

sleep 2s

######################
# prepare
######################

dnf -yq update
dnf -yq install make cmake gcc gcc-c++ git boost-devel openldap-devel @development-tools
git submodule init --recursive

######################
# build
######################

cat<<- EOF

-------------------------------------
Starting build for Fedora
-------------------------------------

EOF

cd ges-code
rm -rf build && mkdir build
cd build && cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make VERBOSE=1 -j4
