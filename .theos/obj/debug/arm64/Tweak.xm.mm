#line 1 "Tweak.xm"
#import "Arknights/StoreKitManager.h"
#import "UIKit/UIKit.h"

#import "AppViewController.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class StoreKitManager; 


#line 6 "Tweak.xm"
static StoreKitManager* (*_logos_orig$Hooks$StoreKitManager$init)(_LOGOS_SELF_TYPE_INIT StoreKitManager*, SEL) _LOGOS_RETURN_RETAINED; static StoreKitManager* _logos_method$Hooks$StoreKitManager$init(_LOGOS_SELF_TYPE_INIT StoreKitManager*, SEL) _LOGOS_RETURN_RETAINED; 


static StoreKitManager* _logos_method$Hooks$StoreKitManager$init(_LOGOS_SELF_TYPE_INIT StoreKitManager* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
	
	id r = _logos_orig$Hooks$StoreKitManager$init(self, _cmd);

	static dispatch_once_t once;
	dispatch_once(&once, ^{
		AppViewController *appViewController = [[AppViewController alloc] init];

		NSLog(@"DEBUG* appViewController %@", appViewController);
		NSLog(@"DEBUG* appView %@", appViewController.view);

		
		
		
		
		
		
		
		
		

		
		

		
		
		
		
		
		

		UIWindow *window = [UIApplication sharedApplication].keyWindow;
		appViewController.view.center = window.center;
    [window addSubview:appViewController.view];
	});

	NSLog(@"DEBUG* StoreKitManager init");

	return r;
}




static __attribute__((constructor)) void _logosLocalCtor_544b3284(int __unused argc, char __unused **argv, char __unused **envp) {
	NSLog(@"DEBUG* vendorbuy extension");

	{Class _logos_class$Hooks$StoreKitManager = objc_getClass("StoreKitManager"); { MSHookMessageEx(_logos_class$Hooks$StoreKitManager, @selector(init), (IMP)&_logos_method$Hooks$StoreKitManager$init, (IMP*)&_logos_orig$Hooks$StoreKitManager$init);}}
}
