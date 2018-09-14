# Don't recurse into the platform makefiles. We don't care about them, and
# we don't want to force a reset of BOARD_SEPOLICY_DIRS
#
# If you want to use these policies, add a
#
# include device/qcom/sepolicy-legacy/sepolicy.mk
#
# to your device's BoardConfig. It is highly recommended that in case
# you have your own BOARD_SEPOLICY_DIRS declaration,
# the inclusion happens _before_ those lines
