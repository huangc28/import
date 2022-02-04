#import "../UncleTuuImportCore/AppViewController.h"

%group HarryPotterImporter

%hook APMAnalytics
+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2{
	NSLog(@"DEBUG* APMAnalytics staic paymentQueue intercepted");
}

- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2{
	NSLog(@"DEBUG* APMAnalytics paymentQueue intercepted");
}
%end

%hook FBSDKPaymentObserver
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2{
	NSLog(@"DEBUG* FBSDKPaymentObserver paymentQueue intercepted");
}
%end

%hook NgCheckOrder
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2{
	NSLog(@"DEBUG* NgCheckOrder paymentQueue intercepted");
}
%end

%hook NtIAPHelper
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2{
	NSLog(@"DEBUG* NtIAPHelper paymentQueue intercepted");
}
%end
%hook IOSAppDelegate
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(UIApplication *)app{
	static dispatch_once_t once;

	dispatch_once(&once, ^{
		AppViewController *appViewController = [[AppViewController alloc] init];
		[appViewController renderImportApp];
	});

	return %orig;
}
%end

%end

extern "C" void InitHarryPotterImporter() {
	%init(HarryPotterImporter);
}
