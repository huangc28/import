#line 1 "Tweak.xm"
#import "Arknights/StoreKitManager.h"
#import "UIKit/UIKit.h"


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


#line 4 "Tweak.xm"
static StoreKitManager* (*_logos_orig$Hooks$StoreKitManager$init)(_LOGOS_SELF_TYPE_INIT StoreKitManager*, SEL) _LOGOS_RETURN_RETAINED; static StoreKitManager* _logos_method$Hooks$StoreKitManager$init(_LOGOS_SELF_TYPE_INIT StoreKitManager*, SEL) _LOGOS_RETURN_RETAINED; 


static StoreKitManager* _logos_method$Hooks$StoreKitManager$init(_LOGOS_SELF_TYPE_INIT StoreKitManager* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
	
	id r = _logos_orig$Hooks$StoreKitManager$init(self, _cmd);

	static dispatch_once_t once;
	dispatch_once(&once, ^{
		
		UIView *appSquareView = [
			[UIView alloc] initWithFrame:CGRectMake(
				0,
				0,
				[[UIScreen mainScreen] applicationFrame].size.width,
				[[UIScreen mainScreen] applicationFrame].size.height
			)
		];

		
		appSquareView.backgroundColor = [UIColor whiteColor];

		UILabel *tweakLabel = [[UILabel alloc] initWithFrame:appSquareView.bounds];
		tweakLabel.backgroundColor = [UIColor clearColor];
		tweakLabel.text = @"TWEAK";
		tweakLabel.font = [UIFont systemFontOfSize:25];
		tweakLabel.textAlignment = NSTextAlignmentCenter;
		[appSquareView addSubview:tweakLabel];

		UIWindow *window = [UIApplication sharedApplication].keyWindow;
		NSLog(@"DEBUG* app key window %@", window);
		appSquareView.center = window.center;
    [window addSubview:appSquareView];
	});

	NSLog(@"DEBUG* StoreKitManager init");

	return r;
}




static __attribute__((constructor)) void _logosLocalCtor_a2cc5a99(int __unused argc, char __unused **argv, char __unused **envp) {
	NSLog(@"DEBUG* vendorbuy extension");

	{Class _logos_class$Hooks$StoreKitManager = objc_getClass("StoreKitManager"); { MSHookMessageEx(_logos_class$Hooks$StoreKitManager, @selector(init), (IMP)&_logos_method$Hooks$StoreKitManager$init, (IMP*)&_logos_orig$Hooks$StoreKitManager$init);}}
}
