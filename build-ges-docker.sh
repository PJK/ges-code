#!/bin/bash

# Instructions for docker w/ Travis CI build

apt-get install -yqq cmake libboost-dev libc6-dev libstdc++-4.9-dev
git submodule update --init
rm -rf build && mkdir build
cd build && cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make -j4
