TARGET := iphone:clang:latest:15.0

include $(THEOS)/makefiles/common.mk

FRAMEWORK_NAME = WLogger

WLogger_FILES = WLogger.m
WLogger_PUBLIC_HEADERS = WLogger.h
WLogger_INSTALL_PATH = /Library/Frameworks
WLogger_CFLAGS = -fobjc-arc 
ifeq ($(THEOS_PACKAGE_SCHEME),roothide)
WLogger_LDFLAGS += -install_name @loader_path/WLogger.framework/WLogger
endif
ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
AltList_LDFLAGS += -install_name @rpath/WLogger.framework/WLogger
endif


include $(THEOS_MAKE_PATH)/framework.mk
