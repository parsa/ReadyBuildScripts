#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

curl -JLO https://downloads.sourceforge.net/project/netcat/netcat/0.7.1/netcat-0.7.1.tar.bz2
tar xf netcat-0.7.1.tar.bz2
pushd netcat-0.7.1
./configure --disable-debug --disable-dependency-tracking --prefix=$LOCAL_PATH --mandir=$LOCAL_PATH/share/man --infodir=$LOCAL_PATH/info
make $LOCAL_MAKEFLAGS install

