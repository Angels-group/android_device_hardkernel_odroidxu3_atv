LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libatv_uinputbridge
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := libatv_uinputbridge.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_APPS_PRIVILEGED)/AtvRemoteService/lib/arm
include $(BUILD_PREBUILT)
