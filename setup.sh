#!/bin/bash

# install osxcross
git clone https://github.com/tpoechtrager/osxcross


# build osxcross
cd osxcross/tarballs || exit
wget "$SDK_URL"

cd .. || exit

TARGET_DIR=/usr/local/osxcross UNATTENDED=1 ./build.sh

# cleanup
cd .. || exit
rm -rf osxcross

wget https://github.com/mstorsjo/llvm-mingw/releases/download/20240619/llvm-mingw-20240619-ucrt-ubuntu-20.04-x86_64.tar.xz
tar -xf llvm-mingw-20240619-ucrt-ubuntu-20.04-x86_64.tar.xz

mv llvm-mingw-20240619-ucrt-ubuntu-20.04-x86_64 /usr/local/llvm-mingw