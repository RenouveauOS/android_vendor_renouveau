LOCAL_PATH := $(call my-dir)

# a wrapper for curl which provides wget syntax, for compatibility
include $(CLEAR_VARS)
LOCAL_MODULE := wget
LOCAL_SRC_FILES := bin/wget
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
include $(BUILD_PREBUILT)

################################
# Copies the APN list file into system/etc for the product as apns-conf.xml.
# In the case where $(CUSTOM_APNS_FILE) is defined, the content of $(CUSTOM_APNS_FILE)
# is added or replaced to the $(DEFAULT_APNS_FILE).
include $(CLEAR_VARS)

LOCAL_MODULE := apns-conf.xml
LOCAL_MODULE_CLASS := ETC

DEFAULT_APNS_FILE := vendor/renouveau/prebuilt/common/etc/apns-conf.xml

ifdef CUSTOM_APNS_FILE
CUSTOM_APNS_SCRIPT := vendor/renouveau/tools/custom_apns.py
FINAL_APNS_FILE := $(local-generated-sources-dir)/apns-conf.xml

$(FINAL_APNS_FILE): PRIVATE_SCRIPT := $(CUSTOM_APNS_SCRIPT)
$(FINAL_APNS_FILE): PRIVATE_CUSTOM_APNS_FILE := $(CUSTOM_APNS_FILE)
$(FINAL_APNS_FILE): $(CUSTOM_APNS_SCRIPT) $(DEFAULT_APNS_FILE)
	rm -f $@
	python $(PRIVATE_SCRIPT) $@ $(PRIVATE_CUSTOM_APNS_FILE)
else
FINAL_APNS_FILE := $(DEFAULT_APNS_FILE)
endif

LOCAL_PREBUILT_MODULE_FILE := $(FINAL_APNS_FILE)

# Prebuilt APKs included in Renouveau builds
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := GoogleClock
LOCAL_MODULE_OWNER := rr
LOCAL_SRC_FILES := apps/$(LOCAL_MODULE).apk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := Wallpapers
LOCAL_MODULE_OWNER := rr
LOCAL_SRC_FILES := apps/$(LOCAL_MODULE).apk
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
include $(BUILD_PREBUILT)

#include $(CLEAR_VARS)
#LOCAL_MODULE               := Firefox
#LOCAL_SRC_FILES            := apps/$(LOCAL_MODULE).apk
#LOCAL_MODULE_TAGS          := optional
#LOCAL_MODULE_CLASS         := APPS
#LOCAL_MODULE_SUFFIX        := $(COMMON_ANDROID_PACKAGE_SUFFIX)
#LOCAL_PRIVILEGED_MODULE    := true
#LOCAL_BUILT_MODULE_STEM    := package.apk
#LOCAL_CERTIFICATE          := PRESIGNED
#LOCAL_DEX_PREOPT           := false
#LOCAL_OVERRIDES_PACKAGES   := Jelly
#include $(BUILD_PREBUILT)

# Issue thread permitting redistribution of Niagara: https://github.com/8bitPit/Niagara-Issues/issues/915
include $(CLEAR_VARS)
LOCAL_MODULE               := NiagaraLauncher
LOCAL_SRC_FILES            := apps/$(LOCAL_MODULE).apk
LOCAL_MODULE_TAGS          := optional
LOCAL_MODULE_CLASS         := APPS
LOCAL_MODULE_SUFFIX        := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRIVILEGED_MODULE    := true
LOCAL_BUILT_MODULE_STEM    := package.apk
LOCAL_CERTIFICATE          := PRESIGNED
LOCAL_DEX_PREOPT           := false
LOCAL_OVERRIDES_PACKAGES   := Trebuchet
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := OpenCamera
LOCAL_SRC_FILES            := apps/$(LOCAL_MODULE).apk
LOCAL_MODULE_TAGS          := optional
LOCAL_MODULE_CLASS         := APPS
LOCAL_MODULE_SUFFIX        := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRIVILEGED_MODULE    := true
LOCAL_BUILT_MODULE_STEM    := package.apk
LOCAL_CERTIFICATE          := PRESIGNED
LOCAL_DEX_PREOPT           := true
LOCAL_OVERRIDES_PACKAGES   := Snap \
                              Camera2
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE               := ViperFX
LOCAL_SRC_FILES            := apps/$(LOCAL_MODULE).apk
LOCAL_MODULE_TAGS          := optional
LOCAL_MODULE_CLASS         := APPS
LOCAL_MODULE_SUFFIX        := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRIVILEGED_MODULE    := true
LOCAL_BUILT_MODULE_STEM    := package.apk
LOCAL_CERTIFICATE          := PRESIGNED
LOCAL_DEX_PREOPT           := false
LOCAL_OVERRIDES_PACKAGES   := AudioFX
include $(BUILD_PREBUILT)
