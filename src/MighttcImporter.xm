#import "../../SharedLibraries/Alert.h"
#import "../UncleTuuImportCore/AppViewController.h"
#import "./GameBundleIDs.h"

%group MighttcImporter

%hook APMAnalytics
+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* Mighttc APMAnalytics staic paymentQueue intercepted");

	// %orig;
}

- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* Mighttc APMAnalytics paymentQueue intercepted");

	// %orig;
}
%end

%hook FBSDKPaymentObserver
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* Mighttc FBSDKPaymentObserver paymentQueue intercepted");
}
%end

%hook InAppPurchaseController
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* Mighttc InAppPurchaseController paymentQueue intercepted");

	NSLog(@"DEBUG* Mighttc InAppPurchaseController before orig");

	BOOL bisRequestData = MSHookIvar<BOOL>(self, "m_isRequestData");
	BOOL bisPayment = MSHookIvar<BOOL>(self, "m_isPayment");
	BOOL bisAlreadyExistTransactionObserver = MSHookIvar<BOOL>(self, "m_isAlreadyExistTransactionObserver");
	BOOL bisAlreadyRequestedProductData = MSHookIvar<BOOL>(self, "m_isAlreadyRequestedProductData");
	int bErrorNo = MSHookIvar<int>(self, "m_ErrorNo");

	NSLog(@"DEBUG* m_isRequestData %d", bisRequestData);
	NSLog(@"DEBUG* m_isPayment %d", bisPayment);
	NSLog(@"DEBUG* m_isAlreadyExistTransactionObserver %d", bisAlreadyExistTransactionObserver);
	NSLog(@"DEBUG* m_isAlreadyRequestedProductData %d", bisAlreadyRequestedProductData);
	NSLog(@"DEBUG* m_ErrorNo %d", bErrorNo);

	// %orig;


	NSLog(@"DEBUG* Mighttc InAppPurchaseController after orig");
	BOOL isRequestData = MSHookIvar<BOOL>(self, "m_isRequestData");
	BOOL isPayment = MSHookIvar<BOOL>(self, "m_isPayment");
	BOOL isAlreadyExistTransactionObserver = MSHookIvar<BOOL>(self, "m_isAlreadyExistTransactionObserver");
	BOOL isAlreadyRequestedProductData = MSHookIvar<BOOL>(self, "m_isAlreadyRequestedProductData");
	int ErrorNo = MSHookIvar<int>(self, "m_ErrorNo");

	NSLog(@"DEBUG* m_isRequestData %d", isRequestData);
	NSLog(@"DEBUG* m_isPayment %d", isPayment);
	NSLog(@"DEBUG* m_isAlreadyExistTransactionObserver %d", isAlreadyExistTransactionObserver);
	NSLog(@"DEBUG* m_isAlreadyRequestedProductData %d", isAlreadyRequestedProductData);
	NSLog(@"DEBUG* m_ErrorNo %d", ErrorNo);

}
%end

%hook MightAppDelegate
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2 {
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:Mighttc]) {
		dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 5);

		dispatch_after(delay, dispatch_get_main_queue(), ^(void){
			AppViewController *appViewController = [[AppViewController alloc] init];
			[appViewController renderImportApp];
		});
	}

	return %orig;
}
%end
%end

extern "C" void InitMighttcImporter() {
	%init(MighttcImporter);
}
