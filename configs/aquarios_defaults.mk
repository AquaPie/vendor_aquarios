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

# Versioning System
# aquarios first version.
PRODUCT_VERSION_MAJOR = 9.0
PRODUCT_VERSION_MINOR = Alpha
PRODUCT_VERSION_MAINTENANCE = 1.0
AQUARIOS_POSTFIX := -$(shell date +"%Y%m%d-%H%M")
ifdef AQUARIOS_BUILD_EXTRA
    AQUARIOS_POSTFIX := -$(AQUARIOS_BUILD_EXTRA)
endif

ifndef AQUARIOS_BUILD_TYPE
    AQUARIOS_BUILD_TYPE := UNOFFICIAL
endif

# Set all versions
AQUARIOS_VERSION := AquariOS-$(AQUARIOS_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(AQUARIOS_BUILD_TYPE)$(AQUARIOS_POSTFIX)
AQUARIOS_MOD_VERSION := AquariOS-$(AQUARIOS_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(AQUARIOS_BUILD_TYPE)$(AQUARIOS_POSTFIX)

# AquariOS build properties
PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    aquarios.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.aquarios.version=$(AQUARIOS_VERSION) \
    ro.modversion=$(AQUARIOS_MOD_VERSION) \
    ro.aquarios.buildtype=$(AQUARIOS_BUILD_TYPE)

# Include AquariOS boot animation
ifneq (1080,$(TARGET_SCREEN_WIDTH))
    PRODUCT_COPY_FILES += \
        vendor/aquarios/prebuilt/bootanimation/1080.zip:system/media/bootanimation.zip
endif
ifneq (1440,$(TARGET_SCREEN_WIDTH))
    PRODUCT_COPY_FILES += \
        vendor/aquarios/prebuilt/bootanimation/1440.zip:system/media/bootanimation.zip
endif

# SystemUI Tests
EXCLUDE_SYSTEMUI_TESTS := true

# Use ccache with builds
USE_CCACHE := true

# Try ThinLTO cache
# USE_THINLTO_CACHE=true
