#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Indicate the first api level the device has been commercially launched on
PRODUCT_SHIPPING_API_LEVEL := 27

# Inherit some common PixelExperience stuff
TARGET_INCLUDE_WIFI_EXT := true
TARGET_USES_AOSP_RECOVERY := true
TARGET_BOOT_ANIMATION_RES := 1080
$(call inherit-product, vendor/syberia/common.mk)

# Inherit from NB1 device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Extra Google/Pixel features 
TARGET_SUPPORTS_QUICK_TAP := true

# Build GAPPS
ifeq ($(BUILD_GAPPS),true)
WITH_GMS := true
endif

PRODUCT_NAME := syberia_NB1
PRODUCT_DEVICE := NB1
PRODUCT_MANUFACTURER := HMD Global
PRODUCT_BRAND := Nokia
PRODUCT_MODEL := Nokia 8

PRODUCT_GMS_CLIENTID_BASE := android-hmd-rev2

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=NB1 \
    PRODUCT_NAME=NB1_00WW_FIH \
    PRIVATE_BUILD_DESC="TA-1004_00WW-user 8.1.0 OPR1.170623.026 00WW_4_88B release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Nokia/TA-1004_00WW/NB1:8.1.0/OPR1.170623.026/00WW_4_88B:user/release-keys
