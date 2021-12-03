#import "UIKit/UIKit.h"

#import "AuthModel.h"
#import "AppTopViewController.h"
#import "ProductListViewController.h"
#import "VBStoreKitManager.h"

@interface AppViewController : UIViewController {
	AppTopViewController *_appTopViewController;
	ProductListViewController *_productListViewController;
	VBStoreKitManager *_vbStoreKitManager;
}

@property(strong, nonatomic) AppTopViewController *appTopViewController; // @synthesize appTopViewController=_appTopViewController;
@property(strong, nonatomic) ProductListViewController *productListViewController; // @synthesize productListViewController=_productListViewController;
@property(strong, nonatomic) VBStoreKitManager *vbStoreKitManager; // @synthesize vbStoreKitManager=_vbStoreKitManager

@end
