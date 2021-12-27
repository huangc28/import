TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = import

# UnityFramework: (傳說對決) kgtw

import_EXTRA_FRAMEWORKS = UnityFramework
import_FRAMEWORKS = StoreKit UIKit
import_FILES = Tweak.xm $\
	Lineage2MImporter.xm $\
	ArknightsImporter.xm $\
	LineageMLiveImporter.xm $\
 	KgtwImporter.xm $\
	AppViewController.m $\
	AppTopViewController.m $\
	AuthModel.m $\
	ProductListViewController.m $\
	ProductViewController.m $\
	VBStoreKitManager.m $\
	../SharedLibraries/HttpUtil.m $\
	../SharedLibraries/Product.m $\
	../SharedLibraries/ProductViewElementCreator.m $\
	../SharedLibraries/Alert.m
import_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
