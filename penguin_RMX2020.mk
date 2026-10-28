PENGUIN_CUSTOM_BOOTANIMATION := true
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
#
# Copyright (C) 2018-2022 ArrowOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from device makefile
$(call inherit-product, device/realme/RMX2020/device.mk)

# Inherit PenguinOS common config
$(call inherit-product, vendor/penguin/config/common.mk)
$(call inherit-product, vendor/penguin/config/gsm.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := penguin_RMX2020
PRODUCT_DEVICE := RMX2020
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX2020
PRODUCT_MANUFACTURER := realme

# Build info
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="RMX2020-user 11 RP1A.200720.011 1652239672541 release-keys" \
    BuildFingerprint=realme/RMX2020/RMX2020:11/RP1A.200720.011/1652239672541:user/release-keys \
    DeviceName=RMX2020 \
    DeviceProduct=RMX2020 \
    SystemDevice=RMX2020 \
    SystemName=RMX2020

PRODUCT_GMS_CLIENTID_BASE := android-oppo

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BuildFingerprint)

# 720x1600 panel ke liye resized bootanimation
PRODUCT_COPY_FILES := $(filter-out vendor/penguin/bootanimation/bootanimation.zip:%,$(PRODUCT_COPY_FILES))
PRODUCT_COPY_FILES += device/realme/RMX2020/bootanimation/bootanimation.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
