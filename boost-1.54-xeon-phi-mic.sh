#/bin/bash

mkdir boost
pushd boost
curl -O https://downloads.sf.net/project/boost/boost/1.54.0/boost_1_54_0.tar.bz2
tar xf boost_1_54_0.tar.bz2
pushd boost_1_54_0
./bootstrap.sh
./b2 stage toolset=intel $LOCAL_MAKEFLAGS
#./b2 --build-dir=../1.54.0 --layout=versioned toolset=intel install -j4
# user-config.jam (put this file into your home directory)
# Xeon Phi
# using intel
#   : mic
#   :
#   : <cxxflags>"-std=c++0x -mmic"
#     <linkflags>"-std=c++0x -mmic"
#   ;

