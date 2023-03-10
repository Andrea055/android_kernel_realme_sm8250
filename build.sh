#!/bin/bash

config=sm8250_defconfig
if [ "$1" == "nethunter" ]; then
    config=sm8250_nethunter_defconfig
    echo "Building nethunter"
fi

SOURCE_ROOT=~/workspace/source
MAKE_PATH=${SOURCE_ROOT}/prebuilts/build-tools/linux-x86/bin/
CROSS_COMPILE=/home/andreock/workspace/source/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
KERNEL_ARCH=arm64
KERNEL_DIR=${SOURCE_ROOT}/kernel/android_kernel_realme_sm8250
KERNEL_OUT=${KERNEL_DIR}/../kernel_out
export KERNEL_SRC=${KERNEL_OUT}
export CLANG_TRIPLE=aarch64-linux-gnu-
OUT_DIR=${KERNEL_OUT}
ARCH=${KERNEL_ARCH}
TARGET_INCLUDES=${TARGET_KERNEL_MAKE_CFLAGS}
TARGET_LINCLUDES=${TARGET_KERNEL_MAKE_LDFLAGS}

TARGET_KERNEL_MAKE_ENV+="CC=${SOURCE_ROOT}/prebuilts/clang/host/linux-x86/bin/clang"

cd ${KERNEL_DIR} && \
${MAKE_PATH}make O=${OUT_DIR} ${TARGET_KERNEL_MAKE_ENV} HOSTLDFLAGS="${TARGET_LINCLUDES}" ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip LLVM_IAS=1 -j16 vendor/$config

cd ${KERNEL_DIR} && \
${MAKE_PATH}make O=${OUT_DIR} ${TARGET_KERNEL_MAKE_ENV} HOSTLDFLAGS="${TARGET_LINCLUDES}" ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} menuconfig

# cd ${OUT_DIR} && \
# ${MAKE_PATH}make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} HOSTCFLAGS="${TARGET_INCLUDES}" HOSTLDFLAGS="${TARGET_LINCLUDES}" O=${OUT_DIR} ${TARGET_KERNEL_MAKE_ENV} NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip LLVM_IAS=1 -j16