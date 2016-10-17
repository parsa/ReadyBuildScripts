#/bin/bash
mkdir boost
pushd boost
wget --content-disposition --no-check-certificate https://downloads.sf.net/project/boost/boost/1.61.0/boost_1_61_0.tar.bz2
tar xf boost_1_61_0.tar.bz2
pushd boost_1_61_0
./bootstrap.sh
./b2 stage -j
# Intel:
# pushd boost_1_61_0
# pushd tools/build
# ./bootstrap.sh
# ./b2 install --prefix=$LOCAL_PATH
# export PATH=$LOCAL_PATH:$PATH
# popd
# b2 --build-dir=$BOOST_OBJ_DIR address-model=64 toolset=intel stage
#./b2 --build-dir=../1.61.0 --layout=versioned toolset=clang-3.5 install -j4
# user-config.jam (put this file into your home directory)
# Clang 3.5
# using clang
#   : 3.5
#   : "/Users/parsa/Documents/NMSU/clang+llvm-3.5.0-macosx-apple-darwin/bin/clang++"
#   : <cxxflags>"-std=c++11 -stdlib=libc++ -isystem /Users/parsa/Documents/NMSU/clang+llvm-3.5.0-macosx-apple-darwin/include"
#     <linkflags>"-stdlib=libc++ -L/Users/parsa/Documents/NMSU/clang+llvm-3.5.0-macosx-apple-darwin/lib"
#   ;

