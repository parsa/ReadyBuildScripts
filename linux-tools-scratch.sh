TIP: set -e IS STOP ON ERROR
#++ LAYOUT ++
mkdir -p ~/.local/bin
mkdir -p ~/tools
#++ BASHRC ++
alias ls='ls -Gp --color=auto'
PROCESSOR_COUNT=$(($(grep -c processor /proc/cpuinfo) + 1))
PATH=$HOME/.local/bin:$PATH
LD_LIBRARY_PATH="${HOME}/.local"/lib:$LD_LIBRARY_PATH
C_INCLUDE_PATH="${HOME}/.local"/include:$C_INCLUDE_PATH
CPLUS_INCLUDE_PATH="${HOME}/.local"/include:$CPLUS_INCLUDE_PATH
#++ MLOCATE CONFIG ++
alias updatedb='updatedb -l 0 -o $HOME/.local/mlocate.db -U $HOME'
alias locate='locate -d $HOME/.local/mlocate.db'
#++ CURL ++
pushd ~/tools/
mkdir -p curl/{build,tmp}
pushd curl/
wget http://curl.haxx.se/download/curl-7.38.0.tar.bz2
tar xf curl-7.38.0.tar.bz2
pushd tmp
#../curl-7.38.0/configure --prefix="$(dirname $PWD)/build"
../curl-7.38.0/configure --prefix="${HOME}/.local"
#make -j34
make -j34 install
#cp -r ../build/* ~/.local/
#++ PYTHON ++
pushd ~/tools/
mkdir -p python/{build,tmp}
pushd python/
curl -O https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tgz
tar xf Python-2.7.8.tgz
pushd tmp
#../Python-2.7.8/configure --prefix="$(dirname $PWD)/build"
../Python-2.7.8/configure --prefix="${HOME}/.local"
#make -j34
make -j34 install
#cp -r ../build/* ~/.local/
#++ PERL ++
pushd ~/tools/
mkdir -p perl/build
pushd perl/
curl -O http://www.cpan.org/src/5.0/perl-5.20.1.tar.gz
tar xf perl-5.20.1.tar.gz
pushd perl-5.20.1
#./configure.gnu --prefix="$(dirname $PWD)/build"
./configure.gnu --prefix="${HOME}/.local"
#make -j34
make -j34 install
#cp -r ../build/* ~/.local/
#++ PYTHON 3 ++
pushd ~/tools/
mkdir -p python3/{build,tmp}
pushd python3/
curl -O https://www.python.org/ftp/python/3.4.1/Python-3.4.1.tgz
tar xf Python-3.4.1.tgz
pushd tmp
#../Python-3.4.1/configure --prefix="$(dirname $PWD)/build"
../Python-3.4.1/configure --prefix="${HOME}/.local"
#make -j34
make -j34 install
#cp -r ../build/* ~/.local/
#++ PIP ++
pushd ~/tools
mkdir pip
pushd pip
curl -O https://bootstrap.pypa.io/get-pip.py
chmod +x get-pip.py
./get-pip.py --user
pip install --user docutils
#++ MERCURIAL ++
pushd ~/tools/
mkdir -p hg/build
pushd hg
curl -O http://mercurial.selenic.com/release/mercurial-3.1.1.tar.gz
tar xf mercurial-3.1.1.tar.gz
pushd mercurial-3.1.1
#make -j34 PREFIX="$(dirname $PWD)/build" install
make -j34 PREFIX="{HOME}/.local" install
#cp -r ../build/* ~/.local/
#++ VIM ++
pushd ~/tools
mkdir -p vim/build
pushd vim
hg clone https://code.google.com/p/vim
pushd vim
#./configure --with-features=huge --enable-cscope --enable-luainterp --enable-pythoninterp --enable-rubyinterp --enable-multibyte --enable-gui=auto --with-x --enable-fontset --enable-gnome-check --enable-gtk2-check --with-compiledby="Parsa Amini <me@parsaamini.net>" --with-python-config-dir=/usr/local/lib/python2.7/config --prefix="$(dirname $PWD)/build"
./configure --with-features=huge --enable-cscope --enable-luainterp --enable-pythoninterp --enable-rubyinterp --enable-multibyte --enable-gui=auto --with-x --enable-fontset --enable-gnome-check --enable-gtk2-check --with-compiledby="Parsa Amini <me@parsaamini.net>" --with-python-config-dir=/usr/local/lib/python2.7/config --prefix="${HOME}/.local"
make farsi
make -j34 VIMRUNTIMEDIR="${HOME}/.local"/share/vim/vim74 VIM="${HOME}/.local"/etc
make -j34 install
#cp -r ../build/* ~/.local/
#++ GIT ++
pushd ~/tools/
mkdir -p git/build
pushd git
curl -O https://www.kernel.org/pub/software/scm/git/git-2.1.1.tar.gz
tar xf git-2.1.1.tar.gz
pushd git-2.1.1
#./configure --prefix="$(dirname $PWD)/build" --with-editor="${HOME}/.local"/bin/vim --with-perl="${HOME}/.local"/bin/perl --with-python="${HOME}/.local"/bin/python
./configure --prefix="${HOME}/.local" --with-editor="${HOME}/.local"/bin/vim --with-perl="${HOME}/.local"/bin/perl --with-python="${HOME}/.local"/bin/python
make -j34 install
#cp -r ../build/* ~/.local/
#++ BOOST 1.56 ++
pushd ~
mkdir boost
pushd boost
#curl -O http://hivelocity.dl.sourceforge.net/project/boost/boost/1.56.0/boost_1_56_0.tar.gz
curl -O http://superb-dca2.dl.sourceforge.net/project/boost/boost/1.56.0/boost_1_56_0.tar.bz2
tar xf boost_1_56_0.tar.bz2
pushd boost_1_56_0
./bootstrap.sh
./b2 stage -j34
#++ HWLOC ++
pushd ~/tools
mkdir -p hwloc/{build,tmp}
pushd hwloc
curl -O http://www.open-mpi.org/software/hwloc/v1.9/downloads/hwloc-1.9.1.tar.bz2
tar xf hwloc-1.9.1.tar.bz2
pushd tmp
../hwloc-1.9.1/configure --prefix="$(dirname $PWD)/build"
make -j34 install
#cp -r ../build/* ~/.local/
#++ LIBUNWIND ++
pushd ~/tools
mkdir -p libunwind/{build,tmp}
pushd libunwind
#curl -L -O http://download.savannah.gnu.org/releases/libunwind/libunwind-1.1.tar.gz
curl -O http://nongnu.askapache.com/libunwind/libunwind-1.1.tar.gz
tar xf libunwind-1.1.tar.gz
pushd tmp
../libunwind-1.1/configure --prefix="$(dirname $PWD)/build" #LDFLAGS=-L"${HOME}/.local"/lib
make LDFLAGS=-L"${HOME}/.local"/lib -j34
make -j34 install
#cp -r ../build/* ~/.local/
#++ JEMALLOC ++
pushd ~/tools
mkdir -p jemalloc/build
pushd jemalloc
curl -O http://www.canonware.com/download/jemalloc/jemalloc-3.6.0.tar.bz2
tar xf jemalloc-3.6.0.tar.bz2
pushd jemalloc-3.6.0
./configure --prefix="$(dirname $PWD)/build"
make -j34 install
#cp -r ../build/* ~/.local/
#++ GPERFTOOLS ++
# NEEDS LIBUNWIND
pushd ~/tools
mkdir -p gperftools/build
pushd gperftools
#https://googledrive.com/host/0B6NtGsLhIcf7MWxMMF9JdTN3UVk/gperftools-2.2.1.tar.gz
curl -O https://gperftools.googlecode.com/files/gperftools-2.1.tar.gz
tar xf gperftools-2.2.1.tar.gz
pushd gperftools-2.1
./configure --prefix="$(dirname $PWD)/build" LDFLAGS=-L"${HOME}/.local"/lib C_INCLUDE_PATH="${HOME}/.local"/include/ CPLUS_INCLUDE_PATH="${HOME}/.local"/include/
make LDFLAGS=-L"${HOME}/.local"/lib C_INCLUDE_PATH="${HOME}/.local"/include/ CPLUS_INCLUDE_PATH="${HOME}/.local"/include/ -j34 install
#cp -r ../build/* ~/.local/
#++ HDF5 ++
pushd ~/tools
mkdir -p hdf5/{build,tmp}
pushd hdf5
curl -O http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.13.tar.bz2
tar xf hdf5-1.8.13.tar.bz2
pushd tmp
../hdf5-1.8.13/configure --prefix="$(dirname $PWD)/build"
make -j34 install
#cp -r ../build/* ~/.local/
#++ CMAKE 2.8.12 ++
pushd ~/tools/
mkdir -p cmake/{build,tmp}
pushd cmake/
curl -O http://www.cmake.org/files/v2.8/cmake-2.8.12.2.tar.gz
tar xf cmake-2.8.12.2.tar.gz
pushd tmp
#../cmake-2.8.12.2/configure --prefix="$(dirname $PWD)/build" --parallel=34
../cmake-2.8.12.2/configure --prefix="${HOME}/.local" --parallel=34
make -j34 install
#cp -r ../build/* ~/.local/
#++ CMAKE 3.0.2 ++
pushd ~/tools/
mkdir -p cmake/{build,tmp}
pushd cmake/
curl -O http://www.cmake.org/files/v3.0/cmake-3.0.2.tar.gz
tar xf cmake-3.0.2.tar.gz
pushd tmp
#../cmake-3.0.2/configure --prefix="$(dirname $PWD)/build" --parallel=34
../cmake-3.0.2/configure --prefix="${HOME}/.local" --parallel=34
make -j34 install
#cp -r ../build/* ~/.local/
#++ PAPI ++
pushd ~/tools/
mkdir -p papi/build
pushd papi/
curl -O http://icl.cs.utk.edu/projects/papi/downloads/papi-5.3.2.tar.gz
tar xf papi-5.3.2.tar.gz
pushd papi-5.3.2/src
#./configure --prefix="$(dirname $PWD)/build"
./configure --prefix="${HOME}/.local"
make -j34 install
#cp -r ../../build/* ~/.local/
#++ ISL 0.11 ++
pushd ~/tools
mkdir -p gcc/isl-0.11/{build,tmp}
pushd gcc/isl-0.11
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.11.1.tar.bz2
tar xf isl-0.11.1.tar.bz2
pushd tmp
#../isl-0.11.1/configure --prefix="$(dirname $PWD)/build"
../isl-0.11.1/configure --prefix="${HOME}/.local"
#make -j34
make -j34 install
#cp -r ../build/* ~/.local/
#++ ISL 0.12 ++
pushd ~/tools
mkdir -p gcc/isl-0.12/{build,tmp}
pushd gcc/isl-0.12
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.12.2.tar.bz2
tar xf isl-0.12.2.tar.bz2
pushd tmp
../isl-0.12.2/configure --prefix="$(dirname $PWD)/build"
make -j34
make -j34 install
cp -r ../build/* ~/.local/
#++ GCC 4.9.1 Full ++
pushd ~/tools
mkdir -p gcc/gcc-4.9.1/{build,tmp}
pushd gcc/gcc-4.9.1
curl -O http://www.netgull.com/gcc/releases/gcc-4.9.1/gcc-4.9.1.tar.bz2
tar xf gcc-4.9.1.tar.bz2
pushd gcc-4.9.1/contrib
./download_prerequisites
pushd gmp
./configure --prefix="${HOME}/.local" --enable-cxx=yes
make -j34 install
pushd ..
pushd mpfr
./configure --prefix="${HOME}/.local" --with-gmp="${HOME}/.local"
make -j34 install
pushd ..
pushd mpc
./configure --prefix="${HOME}/.local" --with-gmp="${HOME}/.local" --with-mpfr="${HOME}/.local"
make -j34 install
pushd ..
pushd isl
./configure --prefix="${HOME}/.local" --with-gmp-prefix="${HOME}/.local"
make -j34 install
pushd ..
pushd cloog
./configure --prefix="${HOME}/.local" --with-isl-prefix="${HOME}/.local" --with-gmp-prefix="${HOME}/.local"
make -j34 install
pushd .. # cloog
pushd .. # contrib
pushd .. # gcc-4.9.1
pushd tmp
../gcc-4.9.1/configure --prefix="$(dirname $PWD)/build" --program-suffix="49" --with-mpc="${HOME}/.local" --with-mpfr="${HOME}/.local" --with-gmp="${HOME}/.local" --with-cloog="${HOME}/.local" --with-isl="${HOME}/.local" --enable-languages=c,c++,fortran --enable-tls --enable-static --disable-shared --disable-bootstrap --disable-multilib
nohup make -j34 &
#++ GCC 4.9.1 ++
pushd ~/tools
mkdir -p gcc/gcc-4.9.1/{build,tmp}
pushd gcc/gcc-4.9.1
curl -O http://ftp.gnu.org/gnu/gcc/gcc-4.9.1/gcc-4.9.1.tar.bz2
tar xf gcc-4.9.1.tar.bz2
pushd tmp
../gcc-4.9.1/configure --prefix="$(dirname $PWD)/build" --program-suffix="49" --with-mpc="${HOME}/.local" --with-mpfr="${HOME}/.local" --with-gmp="${HOME}/.local" --with-cloog="${HOME}/.local" --with-isl="${HOME}/.local" --enable-languages=c,c++,fortran --enable-tls --enable-static --disable-shared --disable-bootstrap --disable-multilib
#OR
#../gcc-4.9.1/configure --prefix="${HOME}/.local" --program-suffix=491 --with-mpc="${HOME}/.local" --with-mpfr="${HOME}/.local" --with-gmp="${HOME}/.local" --with-cloog="${HOME}/.local" --with-isl="${HOME}/.local" --enable-languages=c,c++,fortran --enable-tls --enable-static
nohup make -j34 &
#++ GCC 4.8.3 ++
pushd ~/tools
mkdir -p gcc/gcc-4.8.3/{build,tmp}
pushd gcc/gcc-4.8.3
curl -O http://ftp.gnu.org/gnu/gcc/gcc-4.8.3/gcc-4.8.3.tar.bz2
tar xf gcc-4.8.3.tar.bz2
pushd tmp
../gcc-4.8.3/configure --prefix="$(dirname $PWD)/build" --enable-languages=c,c++,fortran --program-suffix="48" --with-mpc="${HOME}/.local" --with-mpfr="${HOME}/.local" --with-gmp="${HOME}/.local" --with-cloog="${HOME}/.local" --with-isl="${HOME}/.local" --enable-tls --enable-static --disable-shared --disable-bootstrap --disable-multilib
nohup make -j34 &
#++ GCC 4.7.4 ++
pushd ~/tools
mkdir -p gcc/gcc-4.7.4/{build,tmp}
pushd gcc/gcc-4.7.4
curl -O http://ftp.gnu.org/gnu/gcc/gcc-4.7.4/gcc-4.7.4.tar.bz2
tar xf gcc-4.7.4.tar.bz2
pushd tmp
../gcc-4.7.4/configure --prefix="$(dirname $PWD)/build" --enable-languages=c,c++,fortran --program-suffix="47" --with-mpc="${HOME}/.local" --with-mpfr="${HOME}/.local" --with-gmp="${HOME}/.local" --with-ppl="${HOME}/.local" --enable-tls --enable-static --disable-shared --disable-bootstrap --disable-multilib
#OR
#../gcc-4.7.4/configure --prefix="$(dirname $PWD)/build" --program-suffix=47 --with-mpc="${HOME}/.local" --with-mpfr="${HOME}/.local" --with-gmp="${HOME}/.local" --with-cloog="${HOME}/.local" --with-isl="${HOME}/.local" --enable-languages=c,c++,fortran --enable-tls --enable-static
nohup make -j34 &
#++ GCC 4.6.4 ++
pushd ~/tools
mkdir -p gcc/gcc-4.6.4/{build,tmp}
pushd gcc/gcc-4.6.4
curl -O http://ftp.gnu.org/gnu/gcc/gcc-4.6.4/gcc-4.6.4.tar.bz2
tar xf gcc-4.6.4.tar.bz2
pushd tmp
../gcc-4.6.4/configure --prefix="$(dirname $PWD)/build" --enable-languages=c,c++,fortran --program-suffix="46" --with-mpc="${HOME}/.local" --with-mpfr="${HOME}/.local" --with-gmp="${HOME}/.local" --with-ppl="${HOME}/.local" --enable-tls --enable-static --disable-shared --disable-bootstrap --disable-multilib
#OR
#../gcc-4.6.4/configure --prefix="$(dirname $PWD)/build" --program-suffix=46 --with-mpc="${HOME}/.local" --with-mpfr="${HOME}/.local" --with-gmp="${HOME}/.local" --with-cloog="${HOME}/.local" --with-isl="${HOME}/.local" --enable-languages=c,c++,fortran --enable-tls --enable-static
nohup make -j34 &
#++ GMP 6.0 ++
pushd ~/tools
mkdir -p gmp-6.0.0a/{build,tmp}
pushd gmp-6.0.0a
curl -O https://gmplib.org/download/gmp/gmp-6.0.0a.tar.bz2
tar xf gmp-6.0.0a.tar.bz2
pushd tmp
../gmp-6.0.0/configure --prefix="$(dirname $PWD)/build" --disable-shared
make -j34
make -j34 install

#++ PPL 0.11.2 ++
pushd ~/tools
mkdir -p gcc/ppl-0.11/{build,tmp}
pushd gcc/ppl-0.11
curl -O http://bugseng.com/external/ppl/download/ftp/releases/0.11.2/ppl-0.11.2.tar.bz2
tar xf ppl-0.11.2.tar.bz2
mkdir -p {build,tmp}
pushd tmp
../ppl-0.11.2/configure --with-gmp="${HOME}/.local" --prefix="$(dirname $PWD)/build" --enable-shared="no"
make -j34 install
cp -r ../build/* ~/.local/
#++ CLANG 3.5 ++
curl -O http://llvm.org/releases/3.5.0/clang+llvm-3.5.0-x86_64-fedora20.tar.xz
tar xf clang+llvm-3.5.0-x86_64-fedora20.tar.xz
#++ GLIBC 2.20
pushd ~/tools
mkdir -p gcc/glibc-2.20/{build,tmp}
curl -O http://ftp.gnu.org/gnu/libc/glibc-2.20.tar.gz
tar xf glibc-2.20.tar.gz
pushd tmp
../glibc-2.20/configure --prefix="$(dirname $PWD)/build" --enable-add-ons --enable-obsolete-rpc --disable-profile
make -j34
make -j34 install
#++ GLIBC 2.19
pushd ~/tools
mkdir -p gcc/glibc-2.19/{build,tmp}
curl -O http://ftp.gnu.org/gnu/libc/glibc-2.19.tar.xz
tar xf glibc-2.19.tar.xz
curl -O http://ftp.gnu.org/gnu/libc/glibc-linuxthreads-2.5.tar.bz2
tar xf glibc-linuxthreads-2.5.tar.bz2
mv linuxthreads* glibc-2.19/
pushd tmp
../glibc-2.19/configure --prefix="$(dirname $PWD)/build" --enable-add-ons=linuxthreads --enable-obsolete-rpc
#OR
#../glibc-2.19/configure --prefix="$(dirname $PWD)/build" --enable-add-ons --enable-obsolete-rpc --disable-profile
#++ GLIBC 2.18
pushd ~/tools
mkdir -p glibc/glibc-2.18/{build,tmp}
pushd glibc/glibc-2.18
curl -O http://ftp.gnu.org/gnu/libc/glibc-2.18.tar.xz
tar xf glibc-2.18.tar.xz
curl -O http://ftp.gnu.org/gnu/libc/glibc-linuxthreads-2.5.tar.bz2
tar xf glibc-linuxthreads-2.5.tar.bz2
mv linuxthreads* glibc-2.18/
pushd tmp
../glibc-2.18/configure --prefix="$(dirname $PWD)/build" --enable-add-ons=linuxthreads --enable-obsolete-rpc
#OR
#../glibc-2.18/configure --prefix="$(dirname $PWD)/build" --enable-add-ons --enable-obsolete-rpc --disable-profile
make -j34 install
#++ BINUTILS ++
# REQUIRES ISL 0.10 or 0.11 only
pushd ~/tools
mkdir -p gcc/binutils/build
pushd gcc/binutils
curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz
tar xf binutils-2.24.tar.gz
pushd binutils-2.24
./configure --prefix="$(dirname $PWD)/build" --with-mpc="${HOME}/.local" --with-mpfr="${HOME}/.local" --with-gmp="${HOME}/.local" --with-cloog="${HOME}/.local" --with-isl="${HOME}/.local"
make -j34
make -j34 install
cp -r ../build/* ~/.local/
#++ M4 ++
pushd ~/tools
mkdir -p m4/{build,tmp}
pushd m4
curl -O http://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.xz
tar xf m4-1.4.17.tar.xz
pushd tmp
#../m4-1.4.17/configure --prefix="$(dirname $PWD)/build"
../m4-1.4.17/configure --prefix="${HOME}/.local"
make -j34 install
#cp -r ../build/* ~/.local/
#++ MAKE ++
pushd ~/tools
mkdir -p make/{build,tmp}
pushd make
curl -O http://ftp.gnu.org/gnu/make/make-4.0.tar.gz
tar xf make-4.0.tar.gz
pushd tmp
#../make-4.0/configure --prefix="$(dirname $PWD)/build"
../make-4.0/configure --prefix="${HOME}/.local"
make -j34 install
#cp -r ../build/* ~/.local/
#++ AUTOCONF ++
pushd ~/tools
mkdir -p autoconf/{build,tmp}
pushd autoconf
curl -O http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz
tar xf autoconf-2.69.tar.xz
pushd tmp
#../autoconf-2.69/configure --prefix="$(dirname $PWD)/build"
../autoconf-2.69/configure --prefix="${HOME}/.local"
make -j34 install
#cp -r ../build/* ~/.local/
#++ AUTOMAKE ++
pushd ~/tools
mkdir -p automake/{build,tmp}
pushd automake
curl -O http://ftp.gnu.org/gnu/automake/automake-1.14.tar.xz
tar xf automake-1.14.tar.xz
pushd tmp
#../automake-1.14/configure --prefix="$(dirname $PWD)/build"
../automake-1.14/configure --prefix="${HOME}/.local"
make -j34 install
#cp -r ../build/* ~/.local/
#++ LIBTOOL ++
pushd ~/tools
mkdir -p libtool/{build,tmp}
pushd libtool
curl -O http://ftp.gnu.org/gnu/libtool/libtool-2.4.tar.xz
tar xf libtool-2.4.tar.xz
pushd tmp
#../libtool-2.4/configure --prefix="$(dirname $PWD)/build"
../libtool-2.4/configure --prefix="${HOME}/.local"
make -j34 install
#cp -r ../build/* ~/.local/
#++ ZLIB ++
pushd ~/tools
mkdir -p zlib/build
pushd zlib
curl -O http://zlib.net/zlib-1.2.8.tar.xz
tar xf zlib-1.2.8.tar.xz
pushd zlib-1.2.8
#./configure --prefix="$(dirname $PWD)/build"
./configure --prefix="${HOME}/.local"
make -j34 install
#cp -r ../build/* ~/.local/
#++ CLANG ++
pushd ~/tools
mkdir -p clang/{build,tmp}
pushd clang
curl -O http://llvm.org/releases/3.5.0/llvm-3.5.0.src.tar.xz
tar xf llvm-3.5.0.src.tar.xz
#--- ../lld-3.5.0.src/lib/Core/Error.cpp	2014-06-13 09:36:45.000000000 -0600
#+++ tools/lld/lib/Core/Error.cpp	2014-10-04 12:32:18.646295950 -0600
#@@ -149,6 +149,8 @@
#     return "lld.dynamic_error";
#   }
# 
#+  ~dynamic_error_category() throw() {}
#+
#   std::string message(int ev) const override {
#     assert(ev >= 0);
#     assert(ev < (int)_messages.size());
curl -O http://llvm.org/releases/3.5.0/cfe-3.5.0.src.tar.xz
tar xf cfe-3.5.0.src.tar.xz
mv cfe-3.5.0.src llvm-3.5.0.src/tools/clang
curl -O http://llvm.org/releases/3.5.0/lld-3.5.0.src.tar.xz
tar xf lld-3.5.0.src.tar.xz
mv lld-3.5.0.src llvm-3.5.0.src/tools/lld
#curl -O http://llvm.org/releases/3.5.0/polly-3.5.0.src.tar.xz
#tar xf polly-3.5.0.src.tar.xz
#mv polly-3.5.0.src llvm-3.5.0.src/tools/polly
curl -O http://llvm.org/releases/3.5.0/compiler-rt-3.5.0.src.tar.xz
tar xf compiler-rt-3.5.0.src.tar.xz
mv compiler-rt-3.5.0.src llvm-3.5.0.src/tools/compiler-rt
curl -O http://llvm.org/releases/3.5.0/test-suite-3.5.0.src.tar.xz
tar xf test-suite-3.5.0.src.tar.xz
mv test-suite-3.5.0.src llvm-3.5.0.src/tools/test-suite
curl -O http://llvm.org/releases/3.5.0/clang-tools-extra-3.5.0.src.tar.xz
tar xf clang-tools-extra-3.5.0.src.tar.xz
mv clang-tools-extra-3.5.0.src llvm-3.5.0.src/tools/clang/tools/
#curl -O http://llvm.org/releases/3.5.0/libcxx-3.5.0.src.tar.xz
#tar xf libcxx-3.5.0.src.tar.xz
#mv libcxx-3.5.0.src llvm-3.5.0.src/projects/libcxx
#
#curl -O http://llvm.org/releases/3.5.0/libcxxabi-3.5.0.src.tar.xz
#tar xf libcxxabi-3.5.0.src.tar.xz
#mv libcxxabi-3.5.0.src llvm-3.5.0.src/projects/libcxxabi
curl -O http://llvm.org/releases/3.5.0/lldb-3.5.0.src.tar.xz
tar xf lldb-3.5.0.src.tar.xz
mv lldb-3.5.0.src llvm-3.5.0.src/tools/lldb
pushd tmp
#cmake -DCMAKE_INSTALL_PREFIX="$(dirname $PWD)/build" -DLLVM_ENABLE_CXX1Y=ON "$(dirname $PWD)/llvm-3.5.0.src" -DCMAKE_CXX_COMPILER="${HOME}/.local/bin/g++" -DCMAKE_C_COMPILER="${HOME}/.local/bin/gcc"
#cmake -DCMAKE_INSTALL_PREFIX="$(dirname $PWD)/build" -DLLVM_ENABLE_CXX1Y=ON "$(dirname $PWD)/llvm-3.5.0.src" -DCMAKE_CXX_COMPILER="/act/gcc-4.7.2/bin/g++" -DCMAKE_C_COMPILER="/act/gcc-4.7.2/bin/gcc"
./configure --prefix=/home/parsa/.local --enable-optimized --disable-bindings --enable-targets=all CC='gcc -I$HOME/.local/include' CXX='g++ -I$HOME/.local/include'
make -j34
make -j34 check-lldb
make -j34 install
#++ PCRE ++
pushd ~/tools/
mkdir -p pcre/{build,tmp}
pushd pcre/
curl -O ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.35.tar.bz2
tar xf pcre-8.35.tar.bz2
pushd tmp
../pcre-8.35/configure --prefix="$(dirname $PWD)/build"
make -j34
make -j34 install
cp -r ../build/* ~/.local/
#++ SWIG ++
pushd ~/tools/
mkdir -p swig/{build,tmp}
pushd swig/
curl -O http://hivelocity.dl.sourceforge.net/project/swig/swig/swig-3.0.2/swig-3.0.2.tar.gz
tar xf swig-3.0.2.tar.gz
pushd tmp
../swig-3.0.2/configure --prefix="$(dirname $PWD)/build"
make -j34
make -j34 install
#cp -r ../build/* ~/.local/
#++ LIBEDIT ++
pushd ~/tools/
mkdir -p libedit/{build,tmp}
pushd libedit/
curl -O http://thrysoee.dk/editline/libedit-20140620-3.1.tar.gz
tar xf libedit-20140620-3.1.tar.gz
pushd tmp
../libedit-20140620-3.1/configure --prefix="$(dirname $PWD)/build" --enable-widec
make -j34
make -j34 install
#cp -r ../build/* ~/.local/
#++ MISC ++
  156  modules
  157  module
  158  module add gcc4.7
  159  module list
  160  module avail
  161  module add gcc-4.7.3
  162  module add gcc-4.7.2
  163  ./clang
  164  gcc --version
  165  ./clang
  166  ldd clang
  167  ldd /lib64/libc.so.6
