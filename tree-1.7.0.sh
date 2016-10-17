#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

PKG_NAME="tree-1.7.0.tgz"
URL="ftp://mama.indstate.edu/linux/tree/$PKG_NAME"
X_PKG_NAME=${PKG_NAME%.*}
X_PKG_NAME=${X_PKG_NAME%.tar}

wget $URL 2>/dev/null || curl -O $URL
tar xf $PKG_NAME
pushd $X_PKG_NAME
make $LOCAL_MAKEFLAGS
cp tree $LOCAL_PATH/bin/

