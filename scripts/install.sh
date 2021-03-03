#! /bin/bash

. ./scripts/common.sh

cd ${BUILD_DIR}
make
cd ${CMAKE_INSTALL_PREFIX}
mkdir logs
