# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# must be before including aosp part
TARGET_BOOT_ANIMATION_RES := 1080

# Inherit from our custom product configuration
$(call inherit-product, vendor/aosp/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/asus/zenfone8/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_DEVICE := zenfone8
PRODUCT_NAME := aosp_zenfone8
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_I006D
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

TARGET_DEVICE := WW_I006D
PRODUCT_SYSTEM_DEVICE := ASUS_I006D
PRODUCT_SYSTEM_NAME := WW_I006D

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=ASUS_I006D \
    PRODUCT_NAME=WW_I006D \
    TARGET_DEVICE=ZS590KS

VENDOR_RELEASE := 12/SKQ1.210821.001/31.1004.0404.81:user/release-keys
BUILD_FINGERPRINT := asus/WW_I006D/ASUS_I006D:$(VENDOR_RELEASE)

PLATFORM_SECURITY_PATCH_OVERRIDE := 2021-11-05

# GApps
TARGET_SHIPS_SEPERATE_GAPPS_BUILD := true
WITH_CORE_GAPPS := true