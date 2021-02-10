#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./gnuscripts

mkdir -pv build
pushd build

cmake ${CMAKE_ARGS} ${SRC_DIR} \
	-DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
	-DCMAKE_INSTALL_LIBDIR:PATH="lib" \
	-DCMAKE_INSTALL_PREFIX:PATH=${PREFIX} \
	-DENABLE_C:BOOL=yes \
	-DENABLE_MATLAB:BOOL=no \
	-DENABLE_PYTHON:BOOL=no \
;

# build
cmake --build . --parallel ${CPU_COUNT} --verbose

# install
cmake --build . --parallel ${CPU_COUNT} --verbose --target install
