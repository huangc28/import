#import "SharedLibraries/HttpUtil.h"
#import "SharedLibraries/Product.h"

#import "AppViewController.h"
#import "AppTopViewController.h"
#import "ProductListViewController.h"
#import "AuthModel.h"

@interface AppViewController ()<UIGestureRecognizerDelegate>
@end

@implementation AppViewController

- (void) viewDidLoad {
	[super viewDidLoad];

	// Initialize AppView here.
	UIView *appView = [
		[UIView alloc] initWithFrame:CGRectMake(
			0,
			0,
			[[UIScreen mainScreen] applicationFrame].size.width,
			[[UIScreen mainScreen] applicationFrame].size.height
		)
	];

	appView.userInteractionEnabled = YES;
	appView.backgroundColor = [UIColor whiteColor];

	// Initialize tap event
	UITapGestureRecognizer *singleFingerTap = [
		[UITapGestureRecognizer alloc]
			initWithTarget:self
							action:@selector(handleTap:)
	];

	[appView addGestureRecognizer:singleFingerTap];
	singleFingerTap.delegate = self;

	// Add tweakLabel to appView
	self.view = appView;

	// Add top bar view controller
	self.appTopViewController = [[AppTopViewController alloc] init];
	[self addChildViewController: self.appTopViewController];
	[self.view addSubview: self.appTopViewController.view];

	// TODO add product list view controller
	self.productListViewController = [[ProductListViewController alloc]	init];
	[self addChildViewController: self.productListViewController];
	[self.view addSubview: self.productListViewController.view];

}

- (void) dealloc {
	self.appTopViewController = nil;
}


//The event handling method
- (void)handleTap:(UITapGestureRecognizer *)recognizer {
	[self.appTopViewController.usernameTextField resignFirstResponder];
	[self.appTopViewController.passwordTextField resignFirstResponder];
}

- (void) didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
