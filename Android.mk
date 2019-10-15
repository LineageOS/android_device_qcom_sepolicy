# Board specific SELinux policy variable definitions
ifeq ($(call is-vendor-board-platform,QCOM),true)
LOCAL_PATH:= $(call my-dir)
BOARD_PLAT_PUBLIC_SEPOLICY_DIR := \
    $(BOARD_PLAT_PUBLIC_SEPOLICY_DIR) \
    $(LOCAL_PATH)/generic/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR := \
    $(BOARD_PLAT_PRIVATE_SEPOLICY_DIR) \
    $(LOCAL_PATH)/generic/private

BOARD_PLAT_PUBLIC_SEPOLICY_DIR := \
    $(BOARD_PLAT_PUBLIC_SEPOLICY_DIR) \
    $(LOCAL_PATH)/qva/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR := \
    $(BOARD_PLAT_PRIVATE_SEPOLICY_DIR) \
    $(LOCAL_PATH)/qva/private

# sepolicy rules for product images
PRODUCT_PUBLIC_SEPOLICY_DIRS := \
    $(PRODUCT_PUBLIC_SEPOLICY_DIRS) \
     $(LOCAL_PATH)/product/public

PRODUCT_PRIVATE_SEPOLICY_DIRS := \
    $(PRODUCT_PRIVATE_SEPOLICY_DIRS) \
     $(LOCAL_PATH)/product/private

ifeq (,$(filter sdm845 sdm710, $(TARGET_BOARD_PLATFORM)))
    BOARD_SEPOLICY_DIRS := \
       $(BOARD_SEPOLICY_DIRS) \
       $(LOCAL_PATH) \
       $(LOCAL_PATH)/generic/vendor/common \
       $(LOCAL_PATH)/qva/vendor/common/sysmonapp \
       $(LOCAL_PATH)/qva/vendor/ssg \
       $(LOCAL_PATH)/timeservice \
       $(LOCAL_PATH)/qva/vendor/qwesas \
       $(LOCAL_PATH)/qva/vendor/common

    ifeq ($(TARGET_SEPOLICY_DIR),)
      BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/generic/vendor/$(TARGET_BOARD_PLATFORM)
      BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/qva/vendor/$(TARGET_BOARD_PLATFORM)
    else
      BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/generic/vendor/$(TARGET_SEPOLICY_DIR)
      BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/qva/vendor/$(TARGET_SEPOLICY_DIR)
    endif

    ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
    BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/generic/vendor/test
    BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/qva/vendor/test
    endif
endif

ifneq (,$(filter sdm845 sdm710, $(TARGET_BOARD_PLATFORM)))
    BOARD_SEPOLICY_DIRS := \
                 $(BOARD_SEPOLICY_DIRS) \
                 $(LOCAL_PATH) \
                 $(LOCAL_PATH)/legacy/vendor/common/sysmonapp \
                 $(LOCAL_PATH)/legacy/vendor/ssg \
                 $(LOCAL_PATH)/timeservice \
                 $(LOCAL_PATH)/legacy/vendor/common

    ifeq ($(TARGET_SEPOLICY_DIR),)
      BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/legacy/vendor/$(TARGET_BOARD_PLATFORM)
    else
      BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/legacy/vendor/$(TARGET_SEPOLICY_DIR)
    endif
    ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
    BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/legacy/vendor/test
    endif
endif
endif
