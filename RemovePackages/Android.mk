LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := RemovePackages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES += YTMusic \
							Drive \
							Maps \
							Gmail2 \
							Videos \
							YouTube \
							talkback \
							Duo \
							Photos \
							PrebuiltGmail \
							RecorderPrebuilt \
							GoogleContacts \
							arcore \
							KidsSupervisionStub \
							TurboPrebuilt \
							SafetyRegulatoryInfo \
							Chrome \
							KidsHomePrebuilt \
							GoogleDialer \
							CarrierLocation \
							TrichromeLibrary \
							TrichromeLibrary-Stub \
							PrebuiltBugle \
							Accord
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)