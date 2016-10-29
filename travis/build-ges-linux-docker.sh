#!/bin/bash

# Instructions for docker w/ Travis CI build

sleep 2s

# prepare
# Travis CI jobs are run in paralelle, each with a different ENV var
# Based on the env var, adjust dependencies, then begin the unified build

if [[ "${CI_DOCKER_IMAGE}" == "32bit/debian:jessie" ]]; then

  DISTRO="Debian"
  apt-get update -qq
  apt-get install -qq cmake gcc g++ git libboost-dev libldap2-dev
  git submodule init --recursive

elif [[ "${CI_DOCKER_IMAGE}" == "daald/ubuntu32:xenial" ]]; then

  DISTRO="Ubuntu"
  apt-get update -qq
  apt-get install -qq cmake gcc g++ git libboost-dev libc6-dev libldap2-dev
  git submodule init --recursive

fi

# build

cat<<- EOF

------------------------------
Starting ${DISTRO} build test
------------------------------

EOF

cd ges-code
rm -rf build && mkdir build
cd build && cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make -j4
