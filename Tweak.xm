#import "FrontBoard/FBProcess.h"
#import "Arknights/StoreKitManager.h"
#import "UIKit/UIKit.h"

#import "AppViewController.h"

%group Hooks

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

%hook IOSAppDelegate
- (void)applicationDidBecomeActive:(UIApplication *)app {
	NSLog(@"DEBUG* applicationDidBecomeActive %@", app);


	static dispatch_once_t once;

	dispatch_once(&once, ^{
		NSLog(@"DEBUG* starting vendor app");
		AppViewController *appViewController = [[AppViewController alloc] init];
		/*UIWindow *window = [UIApplication sharedApplication].keyWindow;*/
		UIWindow *window = app.keyWindow;

		// Override the app view.
		appViewController.view.center = window.center;

		// Override the app controller.
		window.rootViewController = appViewController;
		[window addSubview:appViewController.view];

		NSLog(@"DEBUG* vendor started");
	});


	%orig;
}
%end

%end


%ctor {
	NSLog(@"DEBUG* vendorbuy extension");


	%init(Hooks);
}
