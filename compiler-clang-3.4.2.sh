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

wget http://llvm.org/releases/3.4.2/llvm-3.4.2.src.tar.gz
tar xf llvm-3.4.2.src.tar.gz
mv llvm-3.4.2.src llvm
cd llvm/tools
wget http://llvm.org/releases/3.4.2/cfe-3.4.2.src.tar.gz
tar xf cfe-3.4.2.src.tar.gz
mv cfe-3.4.2.src clang
cd clang/tools
wget http://llvm.org/releases/3.4/clang-tools-extra-3.4.src.tar.gz
tar xf clang-tools-extra-3.4.src.tar.gz
mv clang-tools-extra-3.4 extra
cd ../.. # clang
wget http://llvm.org/releases/3.4/lldb-3.4.src.tar.gz
tar xf lldb-3.4.src.tar.gz
mv lldb-3.4 lldb
wget http://llvm.org/releases/3.4/lld-3.4.src.tar.gz
tar xf lld-3.4.src.tar.gz
mv lld-3.4 lld
cd .. # tools
cd projects
wget http://llvm.org/releases/3.4/compiler-rt-3.4.src.tar.gz
tar xf compiler-rt-3.4.src.tar.gz
mv compiler-rt-3.4 compiler-rt
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
#wget http://llvm.org/releases/3.4.2/libcxx-3.4.2.src.tar.gz
#tar xf libcxx-3.4.2.src.tar.gz
#mv libcxx-3.4.2.src libcxx
#mkdir tmp
#CC=$INSTALL_DIR/bin/clang CXX=$INSTALL_DIR/bin/clang++ cmake -G "Unix Makefiles" -DLIBCXX_CXX_ABI=libsupc++ -DLIBCXX_LIBSUPCXX_INCLUDE_PATHS=$SYS_CPP_INC -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr $HOME/Clang/libcxx
