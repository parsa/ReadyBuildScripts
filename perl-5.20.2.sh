#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p perl/build
pushd perl/
wget http://www.cpan.org/src/5.0/perl-5.20.2.tar.gz
tar xf perl-5.20.2.tar.gz
pushd perl-5.20.2
./configure.gnu --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

