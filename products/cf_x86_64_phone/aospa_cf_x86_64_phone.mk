#
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#
# PenguinOS on Cuttlefish (x86_64, 64-bit only): a framework boot test for the tundra port.
# Same PenguinOS framework/system code as tundra; vendor/kernel from Cuttlefish.
#
# Based on device/google/cuttlefish/vsoc_x86_64_only/phone/aosp_cf.mk (android-17.0.0_r1),
# but WITHOUT USE_SOONG_DEFINED_SYSTEM_IMAGE / PRODUCT_IGNORE_ALL_ANDROIDMK, which would
# replace the system image with the generic AOSP one and drop PenguinOS from the test.
#

ifeq (aospa_cf_x86_64_phone,$(TARGET_PRODUCT))

# device/qcom/common/common.mk (inherited by aospa-target.mk) needs this set at product time.
TARGET_BOARD_PLATFORM := vsoc_x86_64

# System / system_ext / product
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_product.mk)

# Cuttlefish vendor / bootloader
$(call inherit-product, device/google/cuttlefish/shared/phone/device_vendor.mk)
$(call inherit-product, packages/modules/Virtualization/apex/product_packages.mk)
$(call inherit-product, device/google/cuttlefish/shared/aiseal/device_vendor.mk)
$(call inherit-product, device/google/cuttlefish/vsoc_x86_64/bootloader.mk)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/aosp_excluded_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/aosp_excluded_hardware.xml

$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# PenguinOS
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

PRODUCT_NAME := aospa_cf_x86_64_phone
PRODUCT_DEVICE := vsoc_x86_64_only
PRODUCT_BRAND := PenguinOS
PRODUCT_MANUFACTURER := Google
PRODUCT_MODEL := PenguinOS Cuttlefish x86_64 phone

PRODUCT_VENDOR_PROPERTIES += \
    ro.soc.manufacturer=$(PRODUCT_MANUFACTURER) \
    ro.soc.model=$(PRODUCT_DEVICE)

TARGET_BOOT_ANIMATION_RES := 1080

endif
