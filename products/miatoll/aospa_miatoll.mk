#
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#
# Unofficial PenguinOS (Android 17) port for miatoll (curtana/excalibur/gram/joyeuse),
# based on Saamitk/android_device_xiaomi_miatoll (17) adapted to AOSPA.
#

ifeq (aospa_miatoll,$(TARGET_PRODUCT))

# Inherit from the AOSP products the device needs.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from the device configuration.
$(call inherit-product, device/xiaomi/miatoll/device.mk)

# Inherit from the PenguinOS/AOSPA configuration.
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

TARGET_SUPPORTS_OMX_SERVICE := false

PRODUCT_BRAND := Redmi
PRODUCT_DEVICE := miatoll
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Redmi Note 9 Pro
PRODUCT_NAME := aospa_miatoll

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="miatoll_global-user 12 SKQ1.211019.001 V14.0.3.0.SJZMIXM release-keys" \
    BuildFingerprint=Redmi/miatoll_global/miatoll:12/RKQ1.211019.001/V14.0.3.0.SJZMIXM:user/release-keys

endif
