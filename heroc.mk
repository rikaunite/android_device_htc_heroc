#
# Copyright (C) 2009 The Android Open Source Project
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

$(call inherit-product-if-exists, vendor/htc/heroc/device_heroc-vendor.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/heroc/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

DEVICE_PACKAGE_OVERLAYS += device/htc/heroc/overlay

PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-sprint-us \
	ro.com.google.locationfeatures=1 \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	dalvik.vm.lockprof.threshold=500

PRODUCT_COPY_FILES += \
    device/htc/heroc/prebuilt/init.heroc.rc:root/init.heroc.rc \
    device/htc/heroc/prebuilt/ueventd.heroc.rc:root/ueventd.heroc.rc

# Permissions for HeroC
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/heroc/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/heroc/prebuilt/heroc-keypad.kl:system/usr/keylayout/heroc-keypad.kl \
    device/htc/heroc/prebuilt/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

PRODUCT_COPY_FILES += \
    device/htc/heroc/prebuilt/vold.fstab:system/etc/vold.fstab \
    device/htc/heroc/prebuilt/gps.conf:system/etc/gps.conf \
    device/htc/heroc/prebuilt/apns-conf.xml:system/etc/apns-conf.xml

# Product Packages
PRODUCT_PACKAGES += \
    librs_jni \
    sensors.heroc \
    lights.heroc \
    lights.msm7k \
    gralloc.msm7k \
    copybit.msm7k \
    gps.heroc \
    wlan_loader \
    tiwlan.ini \
    dhcpcd.conf \
    libOmxCore \
    libOmxVidEnc \
    libmm-omxcore

PRODUCT_PACKAGES += \
    Gallery3D \
    rzscontrol

# HeroC uses mdpi artwork where available
PRODUCT_LOCALES += mdpi

# Install HeroC kernel modules
$(call inherit-product, device/htc/heroc/heroc-modules.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/small_base.mk)

PRODUCT_NAME := generic_heroc
PRODUCT_DEVICE := heroc
