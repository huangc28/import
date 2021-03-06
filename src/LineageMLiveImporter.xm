#import "../UncleTuuImportCore/AppViewController.h"
#import "GameBundleIDs.h"

%group LineageMLiveImporter

%hook FBSDKPaymentObserver

- (void)paymentQueue:(SKPaymentQueue *)arg1 updatedTransactions:(NSArray *)arg2 {
	NSLog(@"DEBUG* LineageM FBSDKPaymentObserver paymentQueue paralyzed");
}

%end

%hook AppController

- (void)applicationDidBecomeActive:(UIApplication *)app{
	static dispatch_once_t once;

	dispatch_once(&once, ^{
		AppViewController *appViewController = [[AppViewController alloc] init];
		[appViewController renderImportApp:app];
	});

	%orig;
}

%end
%end

extern "C" void InitLineageMLiveImporter() {
	%init(LineageMLiveImporter);
}
