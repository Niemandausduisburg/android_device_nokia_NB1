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

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from NLA device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# riceDroid flags
RISING_CHIPSET := msm8998
RISING_MAINTAINER := Niemandausduisburg
TARGET_USE_PIXEL_FINGERPRINT := false
TARGET_BUILD_APERTURE_CAMERA := true
ifeq ($(BUILD_GAPPS),false)
RISING_PACKAGE_TYPE := AOSP
endif
TARGET_EXCLUDES_AUDIOFX := false

# MindtheGapps
ifeq ($(BUILD_GAPPS),true)
WITH_GMS := false
TARGET_CORE_GMS := false
RISING_PACKAGE_TYPE := MindtheGapps
$(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
endif

# Extra Google/Pixel features 
TARGET_SUPPORTS_QUICK_TAP := true

PRODUCT_NAME := lineage_NLA
PRODUCT_DEVICE := NLA
PRODUCT_MANUFACTURER := HMD Global
PRODUCT_BRAND := Nokia
PRODUCT_MODEL := Nokia 8

PRODUCT_GMS_CLIENTID_BASE := android-hmd-rev2

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=TA-1004_00WW \
    PRIVATE_BUILD_DESC="TA-1004_00WW-user 8.1.0 OPR1.170623.026 00WW_4_88B release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := Nokia/TA-1004_00WW/NB1:8.1.0/OPR1.170623.026/00WW_4_88B:user/release-keys
