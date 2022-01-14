#import "Foundation/Foundation.h"
#import "UIKit/UIKit.h"

#import "PurchasedRecordsListViewController.h"

@interface PurchasedRecordsContainerViewController : UIViewController {
  UIViewController *_topBarViewController;

  PurchasedRecordsListViewController *_purchaseRecordsListViewController;
}

@property(strong, nonatomic) UIViewController *topBarViewController; // @synthesize topBarViewController=_topBarViewController

@property(strong, nonatomic) PurchasedRecordsListViewController *purchaseRecordsListViewController; // @synthesize purchaseRecordsListViewController=_purchaseRecordsListViewController

@end
