#!/usr/bin/env bash

mkdir -p /usr/opencv

cd /usr/opencv
curl -sOL --retry 3 https://github.com/Itseez/opencv/archive/3.1.0.zip 
unzip 3.1.0.zip

cd opencv-3.1.0
mkdir build

cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_NEW_PYTHON_SUPPORT=ON -D BUILD_EXAMPLES=ON ..

make
make install
