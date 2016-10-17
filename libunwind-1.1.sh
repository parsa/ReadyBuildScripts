#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p libunwind/{build,tmp}
pushd libunwind
#curl -L -O http://download.savannah.gnu.org/releases/libunwind/libunwind-1.1.tar.gz
curl -O http://nongnu.askapache.com/libunwind/libunwind-1.1.tar.gz
tar xf libunwind-1.1.tar.gz
pushd tmp
../libunwind-1.1/configure --prefix=$LOCAL_PATH #LDFLAGS=-L"${HOME}/.local"/lib
make $LOCAL_MAKEFLAGS #LDFLAGS=-L"${HOME}/.local"/lib 

