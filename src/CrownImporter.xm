#import "../UncleTuuImportCore/AppViewController.h"
#import "GameBundleIDs.h"

%group CrownImporter

%hook APMAnalytics
+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* APMAnalytics static paymentQueue paralyzed");
}

- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* APMAnalytics paymentQueue paralyzed");
}
%end

%hook FBSDKPaymentObserver
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* FBSDKPaymentObserver paymentQueue paralyzed");
}
%end

%hook JZNgTool
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* JZNgTool paymentQueue paralyzed");
}
%end


%hook UnityAppController
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(UIApplication *)app {
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:Crown]) {
		NSLog(@"DEBUG* UnityAppController application");

		static dispatch_once_t once;

		dispatch_once(&once, ^{
			AppViewController *appViewController = [[AppViewController alloc] init];
			[appViewController renderImportApp];
		});

	}

	return %orig;
}
%end
%end

extern "C" void InitCrownImporter() {
	%init(CrownImporter);
}
