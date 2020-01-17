#! /bin/bash

if [[ -z ${JENKINS_HOME+x} ]]; then
    JENKINS_HOME="/var/lib/jenkins"
fi
echo "JENKINS_HOME=${JENKINS_HOME}"

# Strip git repo url to obtain base name in ${GIT_DIR}
function get_dir_name {
    local base=${1##*/}
    GIT_DIR=${base%.*}
}

JOB_NAME="build-interop"

QIT_GIT_REPO="https://github.com/apache/qpid-interop-test.git"
get_dir_name ${QIT_GIT_REPO}
QIT_GIT_DIR="${GIT_DIR}"

CMAKE_INSTALL_PREFIX="${JENKINS_HOME}/workspace/install"
echo "CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}"

JOB_DIR="${JENKINS_HOME}/workspace/${JOB_NAME}"
BUILD_DIR="${QIT_GIT_DIR}/build"
