#import "UIKit/UIKit.h"

#import "AuthModel.h"
#import "AppTopViewController.h"
#import "ProductListViewController.h"
#import "AppBottomViewController.h"
#import "VBStoreKitManager.h"

@interface AppViewController : UIViewController {
	UIViewController *_gameRootViewController;
	AppTopViewController *_appTopViewController;
	ProductListViewController *_productListViewController;
	AppBottomViewController *_appBottomViewController;
	VBStoreKitManager *_vbStoreKitManager;
}

- (void) renderImportApp:(UIApplication *)app;

@property(strong, nonatomic) UIViewController *gameRootViewController; // @synthesize gameRootViewController=_gameRootViewController
@property(strong, nonatomic) AppTopViewController *appTopViewController; // @synthesize appTopViewController=_appTopViewController;
@property(strong, nonatomic) ProductListViewController *productListViewController; // @synthesize productListViewController=_productListViewController;
@property(strong, nonatomic) AppBottomViewController *appBottomViewController; // @synthesize appBottomViewController=_appBottomViewController;

@property(strong, nonatomic) VBStoreKitManager *vbStoreKitManager; // @synthesize vbStoreKitManager=_vbStoreKitManager

//@property

@end
