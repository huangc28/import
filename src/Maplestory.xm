#import "UIKit/UIKit.h"

#import "../UncleTuuImportCore/AppViewController.h"

%group MaplestoryImporter

%hook APMAnalytics
+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* APMAnalytics static paymentQueue intercepted");
}

- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* APMAnalytics paymentQueue intercepted");
}
%end

%hook AppleManager
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* AppleManager paymentQueue intercepted");
}
%end

%hook FBSDKPaymentObserver
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* FBSDKPaymentObserver paymentQueue intercepted");
}
%end

%hook AppController
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(UIApplication*)app {
	static dispatch_once_t once;

	dispatch_once(&once, ^{
		AppViewController *appViewController = [[AppViewController alloc] init];
		[appViewController renderImportApp];
	});

	return %orig;
}
%end
%end

extern "C" void InitMaplestoryImporter() {
	%init(MaplestoryImporter);
}
