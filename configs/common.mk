# Copyright (C) 2018 AquariOS
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

# add caf to aquarios
-include vendor/aquarios/configs/caf_fw.mk

# Include overlays
#PRODUCT_PACKAGE_OVERLAYS += \
#   vendor/aquarios/overlay/common

# Include some other segments
include vendor/aquarios/configs/aquarios_defaults.mk
include vendor/aquarios/configs/packages.mk
include vendor/aquarios/configs/permissions.mk
include vendor/aquarios/configs/system_fixes.mk

# Proprietary latinIME libs needed for keyboard swype gestures
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so \
    vendor/aquarios/prebuilt/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.setupwizard.rotation_locked=true \
    ro.actionable_compatible_property.enabled=false

# Security Enhanced Linux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/aquarios/prebuilt/root/mkshrc:system/etc/mkshrc

# Clean cache
PRODUCT_COPY_FILES += \
    vendor/aquarios/tools/clean_cache.sh:system/bin/clean_cache.sh
