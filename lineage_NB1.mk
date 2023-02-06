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
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from NB1 device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# riceDroid flags
RICE_CHIPSET := msm8998
RICE_MAINTAINER := Niemandausduisburg
SUSHI_BOOTANIMATION := 1080
TARGET_USE_PIXEL_FINGERPRINT := false

# Extra Google/Pixel features 
TARGET_SUPPORTS_QUICK_TAP := true

# Build GAPPS
ifeq ($(BUILD_GAPPS),true)
WITH_GMS := true
TARGET_CORE_GMS := false
TARGET_CORE_GMS_EXTRAS := false
TARGET_OPTOUT_GOOGLE_TELEPHONY := false
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := false
endif

# GrapheneOS Camera
TARGET_BUILD_GRAPHENEOS_CAMERA := true

PRODUCT_NAME := lineage_NB1
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
