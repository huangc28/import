#import "UIKit/UIKit.h"
#import "../../SharedLibraries/Alert.h"
#import "../UncleTuuImportCore/AppViewController.h"
#import "./GameBundleIDs.h"

%group MbmtwImporter
%hook UnityAppController
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(UIApplication*)app {
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:Mbtw]) {
		dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 5);
		dispatch_after(delay, dispatch_get_main_queue(), ^(void){
			AppViewController *appViewController = [[AppViewController alloc] init];
			[appViewController renderImportApp];
		});
	}

	return %orig;
}
%end

%hook APMAnalytics
+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* APMAnalytics staic paymentQueue intercepted");
}

- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* APMAnalytics paymentQueue intercepted");
}
%end

%hook BTPayment
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* BTPayment paymentQueue intercepted");
}
%end

%hook FBSDKPaymentObserver
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* FBSDKPaymentObserver paymentQueue intercepted");
}
%end

%end

extern "C" void InitMbmtwImporter() {
	%init(MbmtwImporter);
}
