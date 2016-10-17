#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p make/{build,tmp}
pushd make/
wget http://ftp.gnu.org/gnu/make/make-4.0.tar.gz
tar xf make-4.0.tar.gz
pushd tmp
../make-4.0/configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

