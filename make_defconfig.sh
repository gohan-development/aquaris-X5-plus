#!/bin/bash

<<<<<<< 494c8952732045edeea5b70d4677aac289328453
BUILD_SUBARCH=$1
if [ "$BUILD_SUBARCH" = "arm" ]; then
	GCC_SUBDIR=arm-eabi
elif [ "$BUILD_SUBARCH" = "arm64" ]; then
	GCC_SUBDIR=aarch64-linux-android
fi

DEFCONFIG_FILE=$2
=======
DEFCONFIG_FILE=$1
>>>>>>> Add make_defconfig for easier update of kernel defconfigs
if [ -z "$DEFCONFIG_FILE" ]; then
	echo "Need defconfig file(msm_defconfig)!"
	exit -1
fi

<<<<<<< 494c8952732045edeea5b70d4677aac289328453
if [ ! -e arch/$BUILD_SUBARCH/configs/$DEFCONFIG_FILE ]; then
	echo "No such file : arch/$BUILD_SUBARCH/configs/$DEFCONFIG_FILE"
=======
if [ ! -e arch/arm/configs/$DEFCONFIG_FILE ]; then
	echo "No such file : arch/arm/configs/$DEFCONFIG_FILE"
>>>>>>> Add make_defconfig for easier update of kernel defconfigs
	exit -1
fi

# make .config
env KCONFIG_NOTIMESTAMP=true \
<<<<<<< 494c8952732045edeea5b70d4677aac289328453
make ARCH=$BUILD_SUBARCH CROSS_COMPILE=$GCC_SUBDIR- ${DEFCONFIG_FILE}

# run menuconfig
env KCONFIG_NOTIMESTAMP=true \
make menuconfig ARCH=$BUILD_SUBARCH
make savedefconfig ARCH=$BUILD_SUBARCH

# copy .config to defconfig
mv defconfig arch/$BUILD_SUBARCH/configs/${DEFCONFIG_FILE}
=======
make ARCH=arm CROSS_COMPILE=arm-eabi- ${DEFCONFIG_FILE}

# run menuconfig
env KCONFIG_NOTIMESTAMP=true \
make menuconfig ARCH=arm
make savedefconfig ARCH=arm

# copy .config to defconfig
mv defconfig arch/arm/configs/${DEFCONFIG_FILE}
>>>>>>> Add make_defconfig for easier update of kernel defconfigs

# clean kernel object
make mrproper
