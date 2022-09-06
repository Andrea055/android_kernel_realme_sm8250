#2. export some environment variable and build the kernel and dtb

export SOURCE_ROOT=~/workspace/source
export DEFCONFIG=vendor/sm8250_defconfig
export MAKE_PATH=${SOURCE_ROOT}/prebuilts/build-tools/linux-x86/bin/
export CROSS_COMPILE=${SOURCE_ROOT}/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export KERNEL_ARCH=arm64
export KERNEL_DIR=${SOURCE_ROOT}/kernel/msm-4.19
export KERNEL_OUT=${KERNEL_DIR}/../kernel_out
export KERNEL_SRC=${KERNEL_OUT}
export CLANG_TRIPLE=aarch64-linux-gnu-
export OUT_DIR=${KERNEL_OUT}
export ARCH=${KERNEL_ARCH}
export TARGET_INCLUDES=${TARGET_KERNEL_MAKE_CFLAGS}
export TARGET_LINCLUDES=${TARGET_KERNEL_MAKE_LDFLAGS}

export TARGET_KERNEL_MAKE_ENV+="CC=${SOURCE_ROOT}/prebuilts/clang/host/linux-x86/bin/clang"

cd ${KERNEL_DIR} && \
${MAKE_PATH}make O=${OUT_DIR} ${TARGET_KERNEL_MAKE_ENV} HOSTLDFLAGS="${TARGET_LINCLUDES}" ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} -j16 vendor/sm8250_defconfig

# cd ${KERNEL_DIR} && \
# ${MAKE_PATH}make O=${OUT_DIR} ${TARGET_KERNEL_MAKE_ENV} HOSTLDFLAGS="${TARGET_LINCLUDES}" ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} menuconfig

cd ${OUT_DIR} && \
${MAKE_PATH}make ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} HOSTCFLAGS="${TARGET_INCLUDES}" HOSTLDFLAGS="${TARGET_LINCLUDES}" O=${OUT_DIR} ${TARGET_KERNEL_MAKE_ENV} -j16
