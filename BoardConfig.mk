#
# SPDX-FileCopyrightText: 2022-2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nokia/NLA

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.android_dt_dir=/non-existent androidboot.boot_devices=soc/1da4000.ufshc

# QCOM
TARGET_BOARD_PLATFORM := msm8998

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Partitions
TARGET_COPY_OUT_SYSTEM := system
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5368709120
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824

# Inherit from common device tree
include device/nokia/msm8998-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8998

# Camera
TARGET_SUPPORT_HAL1 := false
BOARD_QTI_CAMERA_32BIT_ONLY := true

# Density
TARGET_SCREEN_DENSITY := 520

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := lineageos_NB1_defconfig

# Props
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.qcom

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Include the proprietary files
include vendor/nokia/NLA/BoardConfigVendor.mk
