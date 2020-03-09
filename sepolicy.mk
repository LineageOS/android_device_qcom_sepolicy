# Board specific SELinux policy variable definitions
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/qcom/sepolicy/generic/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/qcom/sepolicy/generic/private

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/qcom/sepolicy/qva/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/qcom/sepolicy/qva/private

# sepolicy rules for product images
PRODUCT_PUBLIC_SEPOLICY_DIRS += \
    device/qcom/sepolicy/product/public

PRODUCT_PRIVATE_SEPOLICY_DIRS += \
    device/qcom/sepolicy/product/private

ifeq (,$(filter sdm845 sdm710, $(TARGET_BOARD_PLATFORM)))
    BOARD_SEPOLICY_DIRS += \
        device/qcom/sepolicy/generic/vendor/common \
        device/qcom/sepolicy/qva/vendor/common/sysmonapp \
        device/qcom/sepolicy/qva/vendor/ssg \
        device/qcom/sepolicy/timeservice \
        device/qcom/sepolicy/qva/vendor/qwesas \
        device/qcom/sepolicy/qva/vendor/common

    ifeq ($(TARGET_SEPOLICY_DIR),)
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy/generic/vendor/$(TARGET_BOARD_PLATFORM)
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy/qva/vendor/$(TARGET_BOARD_PLATFORM)
    else
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy/generic/vendor/$(TARGET_SEPOLICY_DIR)
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy/qva/vendor/$(TARGET_SEPOLICY_DIR)
    endif

    ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy/generic/vendor/test
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy/qva/vendor/test
    endif
endif

ifneq (,$(filter sdm845 sdm710, $(TARGET_BOARD_PLATFORM)))
    BOARD_SEPOLICY_DIRS += \
        device/qcom/sepolicy/legacy/vendor/common/sysmonapp \
        device/qcom/sepolicy/legacy/vendor/ssg \
        device/qcom/sepolicy/timeservice \
        device/qcom/sepolicy/legacy/vendor/common

    ifeq ($(TARGET_SEPOLICY_DIR),)
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy/legacy/vendor/$(TARGET_BOARD_PLATFORM)
    else
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy/legacy/vendor/$(TARGET_SEPOLICY_DIR)
    endif
    ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
      BOARD_SEPOLICY_DIRS += device/qcom/sepolicy/legacy/vendor/test
    endif
endif

-include device/lineage/sepolicy/qcom/sepolicy.mk
