#import "StoreKit/StoreKit.h"
#import "UIKit/UIKit.h"

#import "../UncleTuuImportCore/AppViewController.h"

%group Lineage2MImporter

%hook AppleInAppPurchaseManager

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
	NSLog(@"DEBUG* AppleInAppPurchaseManager paymentQueue paralyzed");
}
%end

%hook FStoreKitHelperV2
- (void)paymentQueueRestoreCompletedTransactionsFinished:(id)arg1 {
	NSLog(@"DEBUG* FStoreKitHelperV2 paymentQueueRestoreCompletedTransactionsFinished paralyzed");
}
%end

%hook FStoreKitHelper
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
	NSLog(@"DEBUG* FStoreKitHelper paymentQueue paralyzed");
}
%end

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

extern "C" void InitLineage2MImporter() {
	%init(Lineage2MImporter);
}
