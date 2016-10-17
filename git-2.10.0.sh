#/bin/bash
URL="https://www.kernel.org/pub/software/scm/git/git-2.10.0.tar.xz"
TOOLS_DIR="$2"
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi
if [ ! -d $TOOLS_DIR ]; then
    $TOOLS_DIR=$LOCAL_PATH
fi

mkdir -p git
pushd git
wget $URL 2>/dev/null || curl -O $URL
tar xf git-2.8.2.tar.xz
pushd git-2.10.0
./configure --prefix=$LOCAL_PATH --with-editor=vim
#./configure --prefix=$LOCAL_PATH --with-editor=$TOOLS_DIR/bin/vim --with-perl=$TOOLS_DIR/bin/perl --with-python=$TOOLS_DIR/bin/python
make $LOCAL_MAKEFLAGS install

