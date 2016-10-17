#/bin/bash

#++ GCC 4.8.3 Full ++
set -e

INSTALL_DIR="${HOME}/tools/gcc/gcc-4.8.3/build"

cd ~/tools
mkdir -p gcc/gcc-4.8.3/{build,tmp}
cd gcc/gcc-4.8.3
curl -O ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.8.3/gcc-4.8.3.tar.bz2
tar xf gcc-4.8.3.tar.bz2
cd gcc-4.8.3/contrib
./download_prerequisites
cd gmp # ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2
#./configure --prefix=$INSTALL_DIR --disable-shared --enable-static --enable-cxx=yes
./configure --prefix=$INSTALL_DIR --enable-cxx=yes
make -j34 install
cd .. # gmp
cd mpfr # ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2
#./configure --prefix=$INSTALL_DIR --disable-shared --enable-static --with-gmp=$INSTALL_DIR
# ----------------------------------------------------------------------
# Libraries have been installed in:
#    /home/parsa/tools/gcc/gcc-4.8.3/build//lib
# 
# If you ever happen to want to link against installed libraries
# in a given directory, LIBDIR, you must either use libtool, and
# specify the full pathname of the library, or use the `-LLIBDIR'
# flag during linking and do at least one of the following:
#    - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
#      during execution
#    - add LIBDIR to the `LD_RUN_PATH' environment variable
#      during linking
#    - use the `-Wl,--rpath -Wl,LIBDIR' linker flag
#    - have your system administrator add LIBDIR to `/etc/ld.so.conf'
# 
# See any operating system documentation about shared libraries for
# more information, such as the ld(1) and ld.so(8) manual pages.
# ----------------------------------------------------------------------
./configure --prefix=$INSTALL_DIR --with-gmp=$INSTALL_DIR
make -j34 install
cd .. # mpfr
cd mpc # ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz
#./configure --prefix=$INSTALL_DIR --disable-shared --enable-static --with-gmp=$INSTALL_DIR --with-mpfr=$INSTALL_DIR
./configure --prefix=$INSTALL_DIR --with-gmp=$INSTALL_DIR --with-mpfr=$INSTALL_DIR
make -j34 install
cd .. # mpc
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/ppl-0.11.tar.gz
tar xf ppl-0.11.tar.gz
cd ppl-0.11
./configure --prefix=$INSTALL_DIR --with-gmp=$INSTALL_DIR --enable-interfaces=c,cxx
make -j34 install
cd .. # ppl
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/cloog-0.18.1.tar.gz
tar xf cloog-0.18.1.tar.gz
cd cloog-0.18.1
./configure --prefix=$INSTALL_DIR --with-ppl=$INSTALL_DIR --with-gmp=$INSTALL_DIR --with-bits=gmp
make -j34 install
cd .. # cloog
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.11.1.tar.bz2
tar xf isl-0.11.1.tar.bz2
./configure --prefix=$INSTALL_DIR
cd .. # isl
cd .. # contrib
cd .. # gcc-4.8.3
cd tmp
#../gcc-4.8.3/configure --prefix="$(dirname $PWD)/build" --program-suffix="-4.8" --with-mpc=$INSTALL_DIR --with-mpfr=$INSTALL_DIR --with-gmp=$INSTALL_DIR --with-cloog=$INSTALL_DIR --with-isl=$INSTALL_DIR --enable-languages=c,c++,fortran --enable-tls --enable-static --disable-shared --disable-bootstrap --disable-multilib --enable-threads=posix --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
../gcc-4.8.3/configure --prefix="$(dirname $PWD)/build" --program-suffix="-4.8" --with-mpc=$INSTALL_DIR --with-mpfr=$INSTALL_DIR --with-gmp=$INSTALL_DIR --with-cloog=$INSTALL_DIR --with-isl=$INSTALL_DIR --enable-languages=c,c++,fortran --enable-tls --disable-bootstrap --disable-multilib --enable-threads=posix --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
# hermione: ../src/configure -v --with-pkgversion='Debian 4.6.4-7' --with-bugurl=file:///usr/share/doc/gcc-4.6/README.Bugs --enable-languages=c,c++,fortran,objc,obj-c++ --prefix=/usr --program-suffix=-4.6 --enable-shared --enable-linker-build-id --with-system-zlib --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --with-gxx-include-dir=/usr/include/c++/4.6 --libdir=/usr/lib --enable-nls --with-sysroot=/ --enable-clocale=gnu --enable-libstdcxx-debug --enable-gnu-unique-object --disable-libmudflap --enable-plugin --enable-objc-gc --with-arch-32=i586 --with-tune=generic --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
# akita: ../configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-bootstrap --enable-shared --enable-threads=posix --enable-checking=release --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-build-id --with-linker-hash-style=gnu --enable-languages=c,c++,objc,obj-c++,java,fortran,ada,go,lto --enable-plugin --enable-initfini-array --disable-libgcj --with-isl=/builddir/build/BUILD/gcc-4.8.2-20140120/obj-x86_64-redhat-linux/isl-install --with-cloog=/builddir/build/BUILD/gcc-4.8.2-20140120/obj-x86_64-redhat-linux/cloog-install --enable-gnu-indirect-function --with-tune=generic --with-arch_32=x86-64 --build=x86_64-redhat-linux
# stampede: ../configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-bootstrap --enable-shared --enable-threads=posix --enable-checking=release --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-languages=c,c++,objc,obj-c++,java,fortran,ada --enable-java-awt=gtk --disable-dssi --with-java-home=/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre --enable-libgcj-multifile --enable-java-maintainer-mode --with-ecj-jar=/usr/share/java/eclipse-ecj.jar --disable-libjava-multilib --with-ppl --with-cloog --with-tune=generic --with-arch_32=i686 --build=x86_64-redhat-linux
# bach: ../configure --prefix=/usr --infodir=/usr/share/info --mandir=/usr/share/man --libdir=/usr/lib64 --libexecdir=/usr/lib64 --enable-languages=c,c++,objc,fortran,obj-c++,java,ada --enable-checking=release --with-gxx-include-dir=/usr/include/c++/4.8 --enable-ssp --disable-libssp --disable-plugin --with-bugurl=http://bugs.opensuse.org/ --with-pkgversion='SUSE Linux' --disable-libgcj --disable-libmudflap --with-slibdir=/lib64 --with-system-zlib --enable-__cxa_atexit --enable-libstdcxx-allocator=new --disable-libstdcxx-pch --enable-version-specific-runtime-libs --enable-linker-build-id --program-suffix=-4.8 --enable-linux-futex --without-system-libunwind --with-arch-32=i586 --with-tune=generic --build=x86_64-suse-linux
make -j34
make -j34 install

