# Board specific SELinux policy variable definitions
ifeq ($(call is-vendor-board-platform,QCOM),true)
LOCAL_PATH:= $(call my-dir)
BOARD_SEPOLICY_DIRS := \
       $(BOARD_SEPOLICY_DIRS) \
       $(LOCAL_PATH) \
       $(LOCAL_PATH)/qva/vendor/common/sysmonapp \
       $(LOCAL_PATH)/generic/vendor/common \
       $(LOCAL_PATH)/generic/vendor/$(TARGET_BOARD_PLATFORM) \
       $(LOCAL_PATH)/qva/vendor/$(TARGET_BOARD_PLATFORM) \
       $(LOCAL_PATH)/qva/vendor/common \
       $(LOCAL_PATH)/qva/vendor/ssg

BOARD_PLAT_PUBLIC_SEPOLICY_DIR := \
    $(BOARD_PLAT_PUBLIC_SEPOLICY_DIR) \
    $(LOCAL_PATH)/generic/public \
     $(LOCAL_PATH)/qva/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR := \
    $(BOARD_PLAT_PRIVATE_SEPOLICY_DIR) \
    $(LOCAL_PATH)/generic/private \
    $(LOCAL_PATH)/qva/private

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/generic/vendor/test
endif

endif
