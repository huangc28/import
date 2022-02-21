#import "../UncleTuuImportCore/AppViewController.h"
#import "GameBundleIDs.h"

%group ProjectNImporter
%hook APMAnalytics
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* ProjectN APMAnalytics paymentQueue paralyzed");

	// %orig;
}

+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* ProjectN APMAnalytics static paymentQueue paralyzed");

	// %orig;
}
%end

%hook ApStore
+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* ProjectN ApStore paymentQueue paralyzed");

	// %orig;
}
%end

%hook FBSDKPaymentObserver
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* ProjectN FBSDKPaymentObserver paymentQueue paralyzed");

	// %orig;
}
%end

%hook FStoreKitHelper
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* ProjectN FStoreKitHelper paymentQueue paralyzed");

	// %orig;
}
%end

%hook FStoreKitHelperV2
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* ProjectN FStoreKitHelperV2 paymentQueue paralyzed");

	// %orig;
}
%end

%hook IAP
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* ProjectN IAP paymentQueue paralyzed");

	NSLog(@"DEBUG* before orig");
	SKPayment *payment = MSHookIvar<SKPayment *>(self, "_promoPayment");

	NSLog(@"DEBUG* 1 _promoPayment %@", payment);

	SKProductsRequest *prodReq = MSHookIvar<SKProductsRequest *>(self, "_request");

	NSLog(@"DEBUG* 2 _request %@", prodReq);

	NSMutableDictionary *respPaymentDic = MSHookIvar<NSMutableDictionary *>(self, "_responsePaymentDictionary");

	NSLog(@"DEBUG* 3 _responsePaymentDictionary %@", respPaymentDic);

	for(NSString *key in [respPaymentDic allKeys]) {
	  NSLog(@"DEBUG* respPaymentDic %@ %@", key,  [respPaymentDic objectForKey:key]);
	}

	NSMutableDictionary *prodInfoDic = MSHookIvar<NSMutableDictionary *>(self, "_productInfoDictionary");

	NSLog(@"DEBUG* 4 _productInfoDictionary %@", prodInfoDic);

	for(NSString *key in [prodInfoDic allKeys]) {
	  NSLog(@"DEBUG* _productInfoDictionary %@ %@", key,  [prodInfoDic objectForKey:key]);
	}

	_Bool isInit = MSHookIvar<_Bool>(self, "_isInit");
	_Bool isFirstPurchase = MSHookIvar<_Bool>(self, "_isFirstPurchase");
	_Bool isSkippedUpdateTranscations = MSHookIvar<_Bool>(self, "_isSkippedUpdateTranscations");
	_Bool isAlreadyAddObserver = MSHookIvar<_Bool>(self, "_isAlreadyAddObserver");

	NSLog(@"DEBUG* 5 isInit %d", isInit);
	NSLog(@"DEBUG* 6 isFirstPurchase %d", isFirstPurchase);
	NSLog(@"DEBUG* 7 isSkippedUpdateTranscations %d", isSkippedUpdateTranscations);
	NSLog(@"DEBUG* 8 isAlreadyAddObserver %d", isAlreadyAddObserver);

	// %orig;
}
%end

//%hook IOSAppDelegate
//- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2 {
//	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
//
//	NSLog(@"DEBUG* IOSAppDelegate %@", bundleIdentifier);
//
//	if ([bundleIdentifier isEqualToString:Ennt]) {
//		NSLog(@"DEBUG* 2 IOSAppDelegate");
//		AppViewController *appViewController = [[AppViewController alloc] init];
//		[appViewController renderImportApp];
//	}
//
//	return %orig;
//}
//%end

%hook IOSAppDelegate
- (void)applicationDidBecomeActive:(UIApplication *)app {
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:Ennt]) {
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

extern "C" void InitProjectNImporter() {
	%init(ProjectNImporter);
}
