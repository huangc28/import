#import "UIKit/UIKit.h"

#import "AuthModel.h"
#import "AppTopViewController.h"
#import "ProductListViewController.h"

@interface AppViewController : UIViewController {
	AppTopViewController *_appTopViewController;
	ProductListViewController *_productListViewController;
}

@property(strong, nonatomic) AppTopViewController *appTopViewController; // @synthesize appTopViewController=_appTopViewController;
@property(strong, nonatomic) ProductListViewController *productListViewController; // @synthesize productListViewController=_productListViewController;

@end
