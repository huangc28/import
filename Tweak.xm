#import "FrontBoard/FBProcess.h"
#import "Arknights/StoreKitManager.h"
#import "UIKit/UIKit.h"

#import "AppViewController.h"

%group Hooks

// 明日方舟
%hook StoreKitManager

- (id)init {
	// Try initiate application here.
	id r = %orig;

	static dispatch_once_t once;
	dispatch_once(&once, ^{
		AppViewController *appViewController = [[AppViewController alloc] init];

		UIApplication *app = [UIApplication sharedApplication];

		[appViewController renderImportApp:app];
	});


	return r;
}
%end

// 天堂 2 m
%hook IOSAppDelegate
- (void)applicationDidBecomeActive:(UIApplication *)app {
	static dispatch_once_t once;

	dispatch_once(&once, ^{
		AppViewController *appViewController = [[AppViewController alloc] init];
		[appViewController renderImportApp:app];
	});


	%orig;
}
%end

%end

%ctor {
	NSLog(@"DEBUG* vendorbuy extension");

	%init(Hooks);
}
