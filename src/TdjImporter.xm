#import "./GameBundleIDs.h"
#import "../UncleTuuImportCore/AppViewController.h"

#import "TDJ/ZlIndexPayment.h"
#import "TDJ/PDSDKBaseManager.h"
#import "TDJ/PDSDKInitView.h"

%group TdjImporter

%hook APMAnalytics
+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* TDJ APMAnalytics static paymentQueue intercepted");

	// %orig;
}

- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* TDJ APMAnalytics paymentQueue intercepted");

	// %orig;
}
%end

%hook FBSDKPaymentObserver
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {
	NSLog(@"DEBUG* TDJ FBSDKPaymentObserver paymentQueue intercepted");

	// %orig;
}
%end

%hook ZlStore
- (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 {

	NSLog(@"DEBUG* TDJ ZlStore paymentQueue intercepted");

	ZlIndexPayment *transactionPersistor = MSHookIvar<ZlIndexPayment *>(self, "_transactionPersistor");

	PDSDKBaseManager *pdsdkBaseManager = transactionPersistor.delegate;

	_Bool initSuccess = MSHookIvar<_Bool>(pdsdkBaseManager, "_FlagInitSuccess");
	_Bool loginSuccess = MSHookIvar<_Bool>(pdsdkBaseManager, "_FlagLoginSuccess");
	_Bool bInitedIm = MSHookIvar<_Bool>(pdsdkBaseManager, "_bInitedIm");
	_Bool showRefundView = MSHookIvar<_Bool>(pdsdkBaseManager, "_showRefundView");
	_Bool requestedRefundInfo = MSHookIvar<_Bool>(pdsdkBaseManager, "_requestedRefundInfo");

	NSLog(@"DEBUG* 1 initSuccess %d", initSuccess);
	NSLog(@"DEBUG* 2 loginSuccess %d", loginSuccess);
	NSLog(@"DEBUG* 3 bInitedIm %d", bInitedIm);
	NSLog(@"DEBUG* 4 showRefundView %d", showRefundView);
	NSLog(@"DEBUG* 5 requestedRefundInfo %d", requestedRefundInfo);

	NSString *logincustomparams = MSHookIvar<NSString *>(pdsdkBaseManager, "_logincustomparams");
	NSString *logoutcustomparams = MSHookIvar<NSString *>(pdsdkBaseManager, "_Logoutcustomparams");
	NSString *paycustomparams =MSHookIvar<NSString *>(pdsdkBaseManager, "_paycustomparams");

	NSLog(@"DEBUG* 6 logincustomparams %@", logincustomparams);
	NSLog(@"DEBUG* 7 logoutcustomparams %@", logoutcustomparams);
	NSLog(@"DEBUG* 8 paycustomparams %@", paycustomparams);

	NSString *pdsdkuid = MSHookIvar<NSString *>(pdsdkBaseManager, "_pdsdkuid");
	NSString *promotingRegisterID = MSHookIvar<NSString *>(pdsdkBaseManager, "_PromotingRegisterID");

	NSLog(@"DEBUG* 9 pdsdkuid %@", pdsdkuid);
	NSLog(@"DEBUG* 10 PromotingRegisterID %@", promotingRegisterID);

	NSString *launchOptions = MSHookIvar<NSString *>(pdsdkBaseManager, "_launchOptions");
	NSMutableArray *goodslist = MSHookIvar<NSMutableArray *>(pdsdkBaseManager, "_goodslist");


	NSLog(@"DEBUG* 11 launchOptions %@", launchOptions);
	NSLog(@"DEBUG* 12 goodslist %@", goodslist);
	NSLog(@"DEBUG* 13 goodslist count %lu", (unsigned long) [goodslist count]);

	id delegate = MSHookIvar<id>(pdsdkBaseManager, "_delegate");
	PDSDKInitView *pdinitView = MSHookIvar<PDSDKInitView *>(pdsdkBaseManager, "_PdinitView");

	NSLog(@"DEBUG* 14 delegate %@", delegate);
	NSLog(@"DEBUG* 15 pdinitView %@", pdinitView);

	//NSLog(@"DEBUG* 1 transactionPersistor %@", transactionPersistor);

	//NSLog(@"DEBUG* 2 transactionPersistor.promotingPayment %@", transactionPersistor.promotingPayment);

	//NSLog(@"DEBUG* 3 transactionPersistor.delegate %@", transactionPersistor.delegate);

	//id receiptVerificator = MSHookIvar<id>(self, "_receiptVerificator");

	//NSLog(@"DEBUG* 4 receiptVerificator %@", receiptVerificator);

  //NSMutableDictionary *products = MSHookIvar<NSMutableDictionary *>(self, "_products");;
	//NSLog(@"DEBUG* 5 products %@", products);
	//for(NSString *key in [products allKeys]) {
	//	NSLog(@"DEBUG 6 key: %@ value: %@", key, [products objectForKey:key]);
	//}

  //NSMutableDictionary *addPaymentParameters = MSHookIvar<NSMutableDictionary *>(self, "_addPaymentParameters");;

	//NSLog(@"DEBUG* 7 products %@", products);
	//for(NSString *key in [addPaymentParameters allKeys]) {
	//	NSLog(@"DEBUG 8 key: %@ value: %@", key, [addPaymentParameters objectForKey:key]);
	//}

	// %orig;
}

%end

%hook UnityAppController
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2 {
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:TDJ]) {
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

extern "C" void InitTdjImporter() {
	%init(TdjImporter);
}
