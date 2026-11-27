#
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

# Dex2oat
ifeq ($(TARGET_CPU_VARIANT),cortex-a510)
    DEX2OAT_TARGET_CPU_VARIANT := cortex-a76
    DEX2OAT_TARGET_CPU_VARIANT_RUNTIME := cortex-a76
endif

ifeq ($(call is-board-platform-in-list,$(QCOM_BOARD_PLATFORMS)),true)
# Include our Qualcomm Board configuration.
include device/qcom/common/BoardConfigQcom.mk
endif

# Include our private configuration - optional.
-include vendor/aospa-priv/target/board/BoardConfigAOSPAPriv.mk

# Kernel configuration.
include vendor/aospa/target/board/BoardConfigKernel.mk

# Soong
include vendor/aospa/target/board/BoardConfigSoong.mk

# Cuttlefish framework test (x86_64): the FaceSense prebuilts are arm64-only, so
# vendor.aospa.biometrics.face.required can never resolve there. Phones are unaffected.
ifeq ($(TARGET_PRODUCT),aospa_cf_x86_64_phone)
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
endif
