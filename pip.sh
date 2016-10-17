#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 0
fi

mkdir pip
pushd pip
wget https://bootstrap.pypa.io/get-pip.py
chmod +x get-pip.py
./get-pip.py --user
# This is actually a prerequisite for Mercurial
pip install --user docutils

