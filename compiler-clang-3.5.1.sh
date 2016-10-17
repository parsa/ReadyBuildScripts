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

wget http://llvm.org/releases/3.5.1/llvm-3.5.1.src.tar.xz
tar xf llvm-3.5.1.src.tar.xz
mv llvm-3.5.1.src llvm
cd llvm/tools
wget http://llvm.org/releases/3.5.1/cfe-3.5.1.src.tar.xz
tar xf cfe-3.5.1.src.tar.xz
mv cfe-3.5.1.src clang
cd clang/tools
wget http://llvm.org/releases/3.5.1/clang-tools-extra-3.5.1.src.tar.xz
tar xf clang-tools-extra-3.5.1.src.tar.xz
mv clang-tools-extra-3.5.1.src extra
cd ../.. # clang
wget http://llvm.org/releases/3.5.1/lldb-3.5.1.src.tar.xz
tar xf lldb-3.5.1.src.tar.xz
mv lldb-3.5.1.src lldb
wget http://llvm.org/releases/3.5.1/lld-3.5.1.src.tar.xz
tar xf lld-3.5.1.src.tar.xz
mv lld-3.5.1.src lld
cd .. # tools
cd projects
wget http://llvm.org/releases/3.5.1/compiler-rt-3.5.1.src.tar.xz
tar xf compiler-rt-3.5.1.src.tar.xz
mv compiler-rt-3.5.1.src compiler-rt
wget http://llvm.org/releases/3.5.1/libcxxabi-3.5.1.src.tar.xz
tar xf libcxxabi-3.5.1.src.tar.xz
mv libcxxabi-3.5.1.src libcxxabi
wget http://llvm.org/releases/3.5.1/libcxx-3.5.1.src.tar.xz
tar xf libcxx-3.5.1.src.tar.xz
mv libcxx-3.5.1.src libcxx
cd .. # projects
cd .. # llvm
mkdir tmp
cd tmp

#CC=gcc49 CXX=g++49 cmake -GNinja -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR -DBUILD_SHARED_LIBS=ON ../llvm
../llvm/configure --prefix=$INSTALL_DIR --enable-optimized --enable-languages=c,c++ --enable-shared
make -j$PROCESSOR_COUNT
make -j$PROCESSOR_COUNT install

#SYS_CPP_INC=`echo | g++ -Wp,-v -x c++ - -fsyntax-only 2>&1 | grep -E include/c++ | grep -v backward | tr "\\n" ";"`
#
#cd .. #llvm
#mkdir libcxx
#cd libcxx
#wget http://llvm.org/releases/3.5.1/libcxx-3.5.1.src.tar.xz
#tar xf libcxx-3.5.1.src.tar.xz
#mv libcxx-3.5.1.src libcxx
#mkdir tmp
#cd tmp
#CC=$INSTALL_DIR/bin/clang CXX=$INSTALL_DIR/bin/clang++ cmake -G "Unix Makefiles" -DLIBCXX_CXX_ABI=libsupc++ -DLIBCXX_LIBSUPCXX_INCLUDE_PATHS=$SYS_CPP_INC -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ../libcxx
