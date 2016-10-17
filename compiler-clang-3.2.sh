#/bin/bash

#++ Clang from repository ++

INSTALL_DIR="$1"
if [ ! -d $INSTALL_DIR ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

PROCESSOR_COUNT=$(($(grep -c processor /proc/cpuinfo) + 2))

set -e

mkdir llvm
cd llvm

wget http://llvm.org/releases/3.2/llvm-3.2.src.tar.gz
tar xf llvm-3.2.src.tar.gz
mv llvm-3.2.src llvm
cd llvm/tools
wget http://llvm.org/releases/3.2/clang-3.2.src.tar.gz
tar xf clang-3.2.src.tar.gz
mv clang-3.2.src clang
cd .. # tools
cd projects
wget http://llvm.org/releases/3.2/compiler-rt-3.2.src.tar.gz
tar xf compiler-rt-3.2.src.tar.gz
mv compiler-rt-3.2.src compiler-rt
cd .. # projects
cd .. # llvm
mkdir tmp
cd tmp

#CC=gcc49 CXX=g++49 cmake -GNinja -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR -DBUILD_SHARED_LIBS=ON ../llvm
../llvm/configure --prefix=$INSTALL_DIR --enable-optimized --enable-languages=c,c++ --enable-shared
make -j$PROCESSOR_COUNT
make -j$PROCESSOR_COUNT install

#SYS_CPP_INC=`echo | g++ -Wp,-v -x c++ - -fsyntax-only 2>&1 | grep -E include/c++ | grep -v backward | tr "\\n" ";"`
#
#cd .. #llvm
#mkdir libcxx
#wget http://llvm.org/releases/3.2/libcxx-3.2.src.tar.gz
#tar xf libcxx-3.2.src.tar.gz
#mv libcxx-3.2.src libcxx
#mkdir tmp
#CC=$INSTALL_DIR/bin/clang CXX=$INSTALL_DIR/bin/clang++ cmake -G "Unix Makefiles" -DLIBCXX_CXX_ABI=libsupc++ -DLIBCXX_LIBSUPCXX_INCLUDE_PATHS=$SYS_CPP_INC -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr $HOME/Clang/libcxx
