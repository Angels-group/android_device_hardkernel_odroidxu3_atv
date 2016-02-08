#
# Copyright (C) 2013 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/hardkernel/odroidxu3

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.odroidxu3 \
    fstab.odroidxu3.sdboot \
    init.odroidxu3.rc \
    init.odroidxu3.usb.rc \
    init.odroidxu3.wifi.rc \
    lpm.rc \
    ueventd.odroidxu3.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/mixer_paths.xml:system/etc/mixer_paths.xml

# audio
PRODUCT_PACKAGES += \
	audio.primary.odroidxu3 \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	tinyplay \
	tinymix \
	tinycap

# wifi
PRODUCT_PACKAGES += \
        hostapd \
        wpa_supplicant.conf \
        dhcpcd.conf \
        wpa_supplicant

PRODUCT_PACKAGES += \
    camera.odroidxu3 \
    libhwjpeg

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs


# HW composer
PRODUCT_PACKAGES += \
    gralloc.exynos5 \
    hwcomposer.exynos5 \
    libion \
    hdmi_cec.odroidxu3

# odroid sensor
PRODUCT_PACKAGES += \
    sensors.odroidxu3

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/odroid-ts.idc:system/usr/idc/odroid-ts.idc \
    $(LOCAL_PATH)/idc/odroid-ts.idc:system/usr/idc/usbio-keypad.idc \
    $(LOCAL_PATH)/idc/Vendor_0eef_Product_0005.idc:system/usr/idc/Vendor_0eef_Product_0005.idc \
    $(LOCAL_PATH)/keylayout/odroid-ts.kl:system/usr/keylayout/odroid-ts.kl \
    $(LOCAL_PATH)/keylayout/Vendor_054c_Product_05c4.kl:system/usr/keylayout/Vendor_054c_Product_05c4.kl \
    $(LOCAL_PATH)/keylayout/odroid-keypad.kl:system/usr/keylayout/odroid-keypad.kl

# Hdmi CEC: Odroid-XU3 works as a playback device (4).
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4

# Memtrack
PRODUCT_PACKAGES += \
    memtrack.exynos5

# Media profile
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml  \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# MobiCore
PRODUCT_PACKAGES += \
	libMcClient \
	libMcRegistry \
	libgdmcprov \
	mcDriverDaemon


# OMX
PRODUCT_PACKAGES += \
    libExynosOMX_Core \
    libOMX.Exynos.AVC.Decoder \
    libOMX.Exynos.AVC.Encoder \
    libOMX.Exynos.MPEG2.Decoder \
    libOMX.Exynos.MPEG4.Decoder \
    libOMX.Exynos.MPEG4.Encoder \
    libOMX.Exynos.VP8.Decoder \
    libOMX.Exynos.VP8.Encoder \
    libstagefrighthw

# Radio
PRODUCT_PACKAGES += \
	mngblt

PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=1 \
    config.disable_bluetooth=true

#RT5370 module firmware
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/configs/rt2870.bin:system/etc/firmware/rt2870.bin

PRODUCT_PROPERTY_OVERRIDES += \
    wlan.modname=8192cu \
    persist.service.bt.a2dp.sink=true

#Hardkernel
PRODUCT_PACKAGES += \
	OdroidUpdater \
	Utility

# Include the Tv parts for use
PRODUCT_PACKAGES += \
    TvProvider \
    TvSettings \
    tv_input.default

# Include the Tv apps
PRODUCT_PACKAGES += \
    com.google.widevine.software.drm \
    LeanbackIme \
    LeanbackLauncher \
    AtvRemoteService \
    GlobalKeyInterceptor \
    TV

# Include AppDrawer
PRODUCT_PACKAGES += \
    AppDrawer \
    CMLeanbackCustomizer

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0


# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    ro.kernel.android.checkjni=0 

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true \
    ro.cwm.repeatable_keys=114,115

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608 \
    ro.adb.secure=0 \
    ro.secure=0 \
    mouse.right.click=back \
    ro.rfkilldisabled=1 \
    wifi.interface=wlan0

# Taken from device/google/atv/tv_core_hardware.xml and modified to include some tablet features
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu3/odroidxu3_core_hardware.xml:system/etc/permissions/odroidxu3_core_hardware.xml \
    device/hardkernel/odroidxu3/android.hardware.type.television.xml:system/etc/permissions/android.hardware.type.television.xml \
    device/hardkernel/odroidxu3/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_CHARACTERISTICS := tv

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/samsung_slsi/exynos5422/exynos5422-vendor.mk)
