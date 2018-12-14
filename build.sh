#!/bin/bash
export ARCH=arm64
export DTC_EXT=/home/devries/Work_Space/Sony_AOSP/out/host/linux-x86/bin/dtc
# export DTC_OVERLAY_TEST_EXT=/home/devries/Work_Space/Sony_AOSP/out/host/linux-x86/bin/ufdt_apply_overlay

export KCFLAGS=-mno-android
export PATH=/home/devries/Work_Space/Sony_AOSP/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin:$PATH
export PATH=/home/devries/Work_Space/Sony_AOSP/out/host/linux-x86/bin:$PATH
export CROSS_COMPILE=aarch64-linux-android-

make -j8 CONFIG_BUILD_ARM64_DT_OVERLAY=y O=./out imagebreaker_defconfig
make -j8 CONFIG_BUILD_ARM64_DT_OVERLAY=y O=./out

mkdtimg create dtbo.img --page_size=4096 `find out/arch/arm64/boot/dts -name "*.dtbo"`
