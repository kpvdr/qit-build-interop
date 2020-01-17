#! /bin/bash

. ./scripts/common.sh

if [[ ! -d ${BUILD_DIR} ]]; then
    mkdir -p ${BUILD_DIR}
fi
cd ${BUILD_DIR}

cmake -DPROTON_INSTALL_DIR="${CMAKE_INSTALL_PREFIX}" -DCMAKE_INSTALL_PREFIX="${CMAKE_INSTALL_PREFIX}" ..
make all

