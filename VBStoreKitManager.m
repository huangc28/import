#import "VBStoreKitManager.h"

@implementation VBStoreKitManager

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased: {
              NSLog(@"DEBUG* transaction success %@", transaction);

							NSURL *receiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
							NSData *receipt = [NSData dataWithContentsOfURL:receiptURL];
							if (!receipt) {
							    NSLog(@"DEBUG* no receipt");
							    /* No local receipt -- handle the error. */
							} else {
							    /* Get the receipt in encoded format */
							    NSString *encodedReceipt = [receipt base64EncodedStringWithOptions:0];

							    NSLog(@"DEBUG* encodedReceipt %@", encodedReceipt);
							}


							[[SKPaymentQueue defaultQueue] finishTransaction: transaction];
							NSLog(@"DEBUG* finishTransaction");

							break;
						}

            case SKPaymentTransactionStateFailed: {

                NSLog(@"DEBUG* Transaction Failed");
                // [[SKPaymentQueue defaultQueue]
                //      finishTransaction:transaction];
                break;
						}

            default: {
							break;
						}
        }
    }
}


@end
