#! /bin/bash

set -e

SCRIPT_PATH=$(cd $(dirname ${0}); pwd -P)
source ${SCRIPT_PATH}/variant_configuration.bash

TK_PATH=$(realpath ${SCRIPT_PATH}/../../../../../../../..)

HOST_OS=${HOST_OS_KIND}_${HOST_OS_VERSION}

TARGET_OS=${TARGET_OS_KIND}_${TARGET_OS_VERSION}

COMPILER=${COMPILER_KIND}_${COMPILER_VERSION}_cxx_${COMPILER_CXX_DIALECT}

VARIANT_PATH=${TK_PATH}/libcudacxx/docker/host_${HOST_ARCH}/${HOST_OS}/target_${TARGET_ARCH}/${TARGET_OS}/${COMPILER_KIND}_${COMPILER_VERSION}/cxx_${COMPILER_CXX_DIALECT}

OS_IMAGE=${TARGET_OS_KIND}:${TARGET_OS_VERSION}

BASE_NAME=libcudacxx_base__host_${HOST_ARCH}_${HOST_OS}__target_${TARGET_ARCH}_${TARGET_OS}__${COMPILER}
BASE_IMAGE=libcudacxx_base:host_${HOST_ARCH}_${HOST_OS}__target_${TARGET_ARCH}_${TARGET_OS}__${COMPILER}
BASE_DOCKERFILE=${VARIANT_PATH}/base.Dockerfile

FINAL_NAME=libcudacxx_host__${HOST_ARCH}_${HOST_OS}__target_${TARGET_ARCH}_${TARGET_OS}__${COMPILER}
FINAL_IMAGE=libcudacxx:host_${HOST_ARCH}_${HOST_OS}__target_${TARGET_ARCH}_${TARGET_OS}__${COMPILER}
FINAL_DOCKERFILE=${VARIANT_PATH}/final.Dockerfile

echo "SCRIPT_PATH=${SCRIPT_PATH}"
echo "TK_PATH=${TK_PATH}"
echo "VARIANT_PATH=${VARIANT_PATH}"
echo
echo "HOST_ARCH=${HOST_ARCH}"
echo "HOST_OS_KIND=${HOST_OS_KIND}"
echo "HOST_OS_VERSION=${HOST_OS_VERSION}"
echo "HOST_OS=${HOST_OS}"
echo
echo "TARGET_ARCH=${TARGET_ARCH}"
echo "TARGET_OS_KIND=${TARGET_OS_KIND}"
echo "TARGET_OS_VERSION=${TARGET_OS_VERSION}"
echo "TARGET_OS=${TARGET_OS}"
echo
echo "COMPILER_KIND=${COMPILER_KIND}"
echo "COMPILER_VERSION=${COMPILER_VERSION}"
echo "COMPILER_CXX_DIALECT=${COMPILER_CXX_DIALECT}"
echo "COMPILER=${COMPILER}"
echo
echo "OS_IMAGE=${OS_IMAGE}"
echo
echo "BASE_NAME=${BASE_NAME}"
echo "BASE_IMAGE=${BASE_IMAGE}"
echo "BASE_DOCKERFILE=${BASE_DOCKERFILE}"
echo
echo "FINAL_NAME=${FINAL_NAME}"
echo "FINAL_IMAGE=${FINAL_IMAGE}"
echo "FINAL_DOCKERFILE=${FINAL_DOCKERFILE}"
echo

