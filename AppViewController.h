#import "UIKit/UIKit.h"
#import "AuthModel.h"
#import "AppTopViewController.h"

@interface AppViewController : UIViewController {
	AppTopViewController *_appTopViewController;
}

@property (strong, nonatomic) AppTopViewController *appTopViewController; // @synthesize appTopViewController=_appTopViewController;

@end
