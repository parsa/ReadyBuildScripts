#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir hg
pushd hg
wget http://mercurial.selenic.com/release/mercurial-3.3.tar.gz
tar xf mercurial-3.3.tar.gz
pushd mercurial-3.3
make $LOCAL_MAKEFLAGS PREFIX=$LOCAL_PATH install

