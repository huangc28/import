@class NSArray, NSError, SKPayment, SKPaymentQueue, SKProduct;

@protocol SKPaymentTransactionObserver <NSObject>
- (void)paymentQueue:(SKPaymentQueue *)arg1 updatedTransactions:(NSArray *)arg2;

@optional
- (_Bool)paymentQueue:(SKPaymentQueue *)arg1 shouldAddStorePayment:(SKPayment *)arg2 forProduct:(SKProduct *)arg3;
- (void)paymentQueue:(SKPaymentQueue *)arg1 updatedDownloads:(NSArray *)arg2;
- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)arg1;
- (void)paymentQueue:(SKPaymentQueue *)arg1 restoreCompletedTransactionsFailedWithError:(NSError *)arg2;
- (void)paymentQueue:(SKPaymentQueue *)arg1 removedTransactions:(NSArray *)arg2;
@end

