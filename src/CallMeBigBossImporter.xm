#import "../UncleTuuImportCore/AppViewController.h"
#import "GameBundleIDs.h"

%group CallMeBigBossImporter

%hook RVProductManager
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* CallMeBigBoss RVProductManager paymentQueue intercepted");
}
%end

%hook APMAnalytics
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* CallMeBigBoss APMAnalytics paymentQueue intercepted");
}

+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* CallMeBigBoss APMAnalytics static paymentQueue intercepted");
}
%end

%hook FBSDKPaymentObserver
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* CallMeBigBoss FBSDKPaymentObserver paymentQueue intercepted");
}
%end

%hook RVResotreTransactionManager
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* CallMeBigBoss RVResotreTransactionManager paymentQueue intercepted");
}
%end

%hook AppController
- (void)applicationDidBecomeActive:(UIApplication *)app {
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:Dzg]) {
		static dispatch_once_t once;

		dispatch_once(&once, ^{
			AppViewController *appViewController = [[AppViewController alloc] init];
			[appViewController renderImportApp:app];
		});
	}

	%orig;
}
%end

%end


extern "C" void InitCallMeBigBossImporter() {
	%init(CallMeBigBossImporter);
}
