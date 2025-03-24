#
# SPDX-FileCopyrightText: 2022-2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nokia/NLA

# A/B
AB_OTA_PARTITIONS += \
    system_ext \
    product \
    odm

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.android_dt_dir=/non-existent androidboot.boot_devices=soc/1da4000.ufshc

# QCOM
TARGET_BOARD_PLATFORM := msm8998

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Partitions
BOARD_PRODUCTIMAGE_MINIMAL_PARTITION_RESERVED_SIZE := true
-include vendor/lineage/config/BoardConfigReservedSize.mk
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_ODM := odm
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SUPER_PARTITION_BLOCK_DEVICES := system hidden
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3727949824
BOARD_SUPER_PARTITION_HIDDEN_DEVICE_SIZE := 39059456
BOARD_SUPER_PARTITION_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_HIDDEN_DEVICE_SIZE))
BOARD_SUPER_PARTITION_GROUPS := nla_dynamic_partitions
BOARD_NLA_DYNAMIC_PARTITIONS_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304) # 4MiB overhead
BOARD_NLA_DYNAMIC_PARTITIONS_PARTITION_LIST := system_ext system vendor product odm

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
