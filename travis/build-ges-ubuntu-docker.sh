#!/bin/bash

# Instructions for docker w/ Travis CI build

apt-get udpate -y
apt-get install -y cmake libboost-dev libc6-dev git
git submodule update --init
rm -rf build && mkdir build
cd build && cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make -j4
