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

#git clone http://llvm.org/git/llvm.git llvm
svn co http://llvm.org/svn/llvm-project/llvm/trunk clang
cd llvm/tools
#git clone http://llvm.org/git/clang.git clang
svn co http://llvm.org/svn/llvm-project/cfe/trunk clang
cd clang/tools
svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra
cd ../.. # clang
svn co http://llvm.org/svn/llvm-project/lldb/trunk lldb
svn co http://llvm.org/svn/llvm-project/lld/trunk lld
cd .. # tools
cd projects
#git clone http://llvm.org/git/compiler-rt.git compiler-rt
svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt
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
#svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx
#mkdir tmp
#CC=$INSTALL_DIR/bin/clang CXX=$INSTALL_DIR/bin/clang++ cmake -G "Unix Makefiles" -DLIBCXX_CXX_ABI=libsupc++ -DLIBCXX_LIBSUPCXX_INCLUDE_PATHS=$SYS_CPP_INC -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr $HOME/Clang/libcxx

