TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = import

import_FRAMEWORKS = StoreKit UIKit CoreGraphics
import_FILES = Tweak.xm $\
									AppViewController.m $\
									AppTopViewController.m $\
									AuthModel.m $\
									ProductListViewController.m $\
									ProductViewController.m $\
									VBStoreKitManager.m $\
									SKMutablePaymentQueue.m $\
									../SharedLibraries/HttpUtil.m $\
									../SharedLibraries/Product.m $\
									../SharedLibraries/ProductViewElementCreator.m $\
									../SharedLibraries/Alert.m
import_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
