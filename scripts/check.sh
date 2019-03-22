#! /bin/bash

. ./scripts/common.sh

error_found=flase

if [[ -d ${CMAKE_INSTALL_PREFIX}/libexec/qpid_interop_test/shims ]]; then
    echo "${CMAKE_INSTALL_PREFIX}/libexec/qpid_interop_test/shims directory found - ok"
else
    echo "error: ${CMAKE_INSTALL_PREFIX}/libexec/qpid_interop_test/shims directory missing"
    error_found=true
fi

if [[ "${error_found}" = true ]]; then
    echo "ERROR: missing directory - exiting with error"
    exit 1
fi

