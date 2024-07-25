#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nokia/NB1

# QCOM
TARGET_BOARD_PLATFORM := msm8998

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Inherit from common device tree
include device/nokia/msm8998-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8998

# Camera
TARGET_SUPPORT_HAL1 := false

# Density
TARGET_SCREEN_DENSITY := 520

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := lineageos_NB1_defconfig

# Props
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3728096384

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Include the proprietary files
include vendor/nokia/NB1/BoardConfigVendor.mk
