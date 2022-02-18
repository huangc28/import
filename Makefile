TARGET := iphone:clang:latest:6.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = import
# import_EXTRA_FRAMEWORKS = UnityFramework_twysios
import_FRAMEWORKS = StoreKit UIKit
import_FILES = $(wildcard ./src/*.xm) $\
	$(wildcard ./UncleTuuImportCore/*.m) $\
	$(wildcard ./UncleTuuImportCore/**/*.m) $\
	$(wildcard ./src/*.m) $\
	$(wildcard ./src/**/*.m) $\
	$(wildcard ../SharedLibraries/*.m) $\
	Tweak.xm
import_CFLAGS = -fobjc-arc
import_CFLAGS += -DAPI_HOST=@\"$(API_HOST)\"

include $(THEOS_MAKE_PATH)/tweak.mk
