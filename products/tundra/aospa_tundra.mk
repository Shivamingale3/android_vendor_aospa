#
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#
# Unofficial PenguinOS port for the Motorola edge 30 fusion (tundra),
# based on the LineageOS tundra + sm7325-common trees.
#

# Only build this product when it is the target product.
ifeq (aospa_tundra,$(TARGET_PRODUCT))

# Inherit from the AOSP products the device needs.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/motorola/tundra/device.mk)

# Inherit from the PenguinOS/AOSPA configuration.
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

TARGET_SUPPORTS_OMX_SERVICE := false

# Device identifiers.
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := tundra
PRODUCT_MANUFACTURER := motorola
PRODUCT_MODEL := motorola edge 30 fusion
PRODUCT_NAME := aospa_tundra

# ART userfaultfd GC: the 5.4 kernel has CONFIG_USERFAULTFD=y and the MREMAP_DONTUNMAP
# backport. Set here because default_art_config.mk (via full_base_telephony) wins over
# values from the inherited device makefiles.
PRODUCT_ENABLE_UFFD_GC := true

# Kernel 5.4 is below the minimum for kernel FCM 7 (5.10). Skip only the OTA-time kernel
# requirement check; the HAL/framework VINTF checks still run.
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Boot animation resolution.
TARGET_BOOT_ANIMATION_RES := 1080

# Build fingerprint from the latest stock firmware (U1SJS34.2-92-10-9).
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="tundra_g-user 14 U1SJS34.2-92-10-9 40971b-55161 release-keys" \
    BuildFingerprint=motorola/tundra_g/tundra:14/U1SJS34.2-92-10-9/40971b-55161:user/release-keys \
    DeviceProduct=tundra_g

endif
