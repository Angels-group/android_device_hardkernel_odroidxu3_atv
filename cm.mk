$(call inherit-product, device/hardkernel/odroidxu3/full_odroidxu3.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tv.mk)

PRODUCT_NAME := cm_odroidxu3
PRODUCT_DEVICE := odroidxu3

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=ODROID-XU3-ATV

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=SVPDTV15_UC \
    PRODUCT_BRAND=Sony
