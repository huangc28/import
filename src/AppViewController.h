#import "UIKit/UIKit.h"
#import "StoreKit/StoreKit.h"

#import "Routes.h"

@interface AppViewController : UIViewController {
	UIViewController *_gameRootViewController;

	Routes *_routes;
}

- (void) renderImportApp:(UIApplication *)app;

@property(strong, nonatomic) UIViewController *gameRootViewController; // @synthesize gameRootViewController=_gameRootViewController

@property(strong, nonatomic) Routes *routes; // @synthesize routes=_routes

@end
