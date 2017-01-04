# Old Style Android.mk
# We use this file for build environments that do not support the ninja based

libiconv_path := $(call my-dir)

libiconv_module_name := libiconv

libiconv_cflags := \
	-Wno-multichar \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-Wno-sign-compare \
	-Wno-static-in-inline \
	-Wno-tautological-compare \
	-Wno-incompatible-pointer-types \
	-Wno-parentheses-equality \
	-D_ANDROID \
	-DLIBDIR="c" \
	-DBUILDING_LIBICONV \
	-DIN_LIBRARY

libiconv_includes := \
	$(libiconv_path) \
	$(libiconv_path)/include \
	$(libiconv_path)/lib \
	$(libiconv_path)/libcharset/include

libiconv_sources := \
	libcharset/lib/localcharset.c \
   	lib/iconv.c \
   	lib/relocatable.c

libiconv_export_include_dirs := \
	$(libiconv_path)/include

LOCAL_PATH := $(libiconv_path)
$(info MODULE.TARGET.STATIC_LIBRARIES.libiconv=$(MODULE.TARGET.STATIC_LIBRARIES.libiconv))

ifndef $(MODULE.TARGET.STATIC_LIBRARIES.libiconv)
include $(CLEAR_VARS)
LOCAL_MODULE := $(libiconv_module_name)
LOCAL_CFLAGS := $(libiconv_cflags)
LOCAL_C_INCLUDES := $(libiconv_includes)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(libiconv_export_include_dirs)
LOCAL_SRC_FILES := $(libiconv_sources)
include $(BUILD_STATIC_LIBRARY)
endif

ifndef $(MODULE.TARGET.SHARED_LIBRARIES.libiconv)
include $(CLEAR_VARS)
LOCAL_MODULE := $(libiconv_module_name)
LOCAL_CFLAGS := $(libiconv_cflags)
LOCAL_C_INCLUDES := $(libiconv_includes)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(libiconv_export_include_dirs)
LOCAL_SRC_FILES := $(libiconv_sources)
include $(BUILD_SHARED_LIBRARY)
endif
