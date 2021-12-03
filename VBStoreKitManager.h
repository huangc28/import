#import "Foundation/Foundation.h"
#import "UIKit/UIKit.h"
#import "StoreKit/StoreKit.h"

@interface VBStoreKitManager : NSObject <SKPaymentTransactionObserver> {
	NSString *_productID;
}

@property(strong, nonatomic) NSString *productID; //@synthesize productID=_productID

@end

