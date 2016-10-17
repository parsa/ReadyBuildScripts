#/bin/bash

for i in $(ls ./build-gcc-*); do (nohup sh $i >$i.out 2>&1 &); done
