#import "UIKit/UIKit.h"

#import "AuthModel.h"
#import "AppTopViewController.h"
#import "ProductListViewController.h"
#import "AppBottomViewController.h"
#import "VBStoreKitManager.h"
#import "Routes.h"

@interface AppViewController : UIViewController {
	UIViewController *_gameRootViewController;

	Routes *_routes;
}

- (void) renderImportApp:(UIApplication *)app;

@property(strong, nonatomic) UIViewController *gameRootViewController; // @synthesize gameRootViewController=_gameRootViewController

@property(strong, nonatomic) Routes *routes; // @synthesize routes=_routes

@end
