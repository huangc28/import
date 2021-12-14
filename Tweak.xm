#import "FrontBoard/FBProcess.h"
#import "Arknights/StoreKitManager.h"
#import "UIKit/UIKit.h"

#import "AppViewController.h"

%group Hooks
%hook UnityAppController
- (void)applicationDidBecomeActive:(id)arg1{
	NSLog(@"DEBUG* applicationDidBecomeActive %@", arg1);

	%orig;
}

- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2{
	return %orig;
}
%end

%hook StoreKitManager

- (id)init {
	// Try initiate application here.
	id r = %orig;

	static dispatch_once_t once;
	dispatch_once(&once, ^{
		NSLog(@"DEBUG* starting vendor app");
		AppViewController *appViewController = [[AppViewController alloc] init];
		UIWindow *window = [UIApplication sharedApplication].keyWindow;

		// Override the app view.
		appViewController.view.center = window.center;

		// Override the app controller.
		window.rootViewController = appViewController;
    [window addSubview:appViewController.view];

		NSLog(@"DEBUG* vendor started");
	});


	return r;
}
%end
%end


%ctor {
	NSLog(@"DEBUG* vendorbuy extension");


	%init(Hooks);
}
