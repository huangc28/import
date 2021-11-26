TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = vendorbuy

vendorbuy_FRAMEWORKS = StoreKit UIKit
vendorbuy_FILES = Tweak.xm AppViewController.m
vendorbuy_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
