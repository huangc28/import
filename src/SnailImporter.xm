// 最強蝸牛 uses the same class hook as "LineageMLiveImporter", "AppController", thus, we do not
// need to inject a hook to host importer app.

%group SnailImporter

%hook APMAnalytics
+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2{
	NSLog(@"DEBUG* APMAnalytics paymentQueue intercepted");
}
%end

%hook FBSDKPaymentObserver
+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2{
	NSLog(@"DEBUG* FBSDKPaymentObserver paymentQueue intercepted");
}
%end

%hook PayModule
+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2{
	NSLog(@"DEBUG* PayModule paymentQueue intercepted");
}
%end

%hook UADSTransactionObserver
+ (void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2{
	NSLog(@"DEBUG* UADSTransactionObserver paymentQueue intercepted");
}
%end
%end

extern "C" void InitSnailImporter() {
	%init(SnailImporter);
}
