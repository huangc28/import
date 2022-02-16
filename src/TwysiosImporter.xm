#import "./GameBundleIDs.h"
#import "../UncleTuuImportCore/AppViewController.h"

%group TwysiosImporter
%hook APMAnalytics
+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* APMAnalytics static paymentQueue intercepted");
}

- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2{
	NSLog(@"DEBUG* APMAnalytics paymentQueue intercepted");
}
%end

%hook EFPurchaseManager
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2{
	NSLog(@"DEBUG* EFPurchaseManager paymentQueue intercepted");
}
%end

%hook FBSDKPaymentObserver
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2{
	NSLog(@"DEBUG* FBSDKPaymentObserver paymentQueue intercepted");
}
%end

%hook UnityAppController
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2 {
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:Twysios]) {
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

extern "C" void InitTwysiosImporter() {
	%init(TwysiosImporter);
}
