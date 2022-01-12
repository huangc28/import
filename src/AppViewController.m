#import "StoreKit/StoreKit.h"

#import "SharedLibraries/HttpUtil.h"
#import "SharedLibraries/Product.h"
#import "SharedLibraries/Alert.h"

#import "AppViewController.h"
#import "Routes.h"

@interface AppViewController ()<UIGestureRecognizerDelegate>
@end

@implementation AppViewController

- (id) init {
	self = [super init];

	self.routes = [Routes sharedInstance];

	return self;
}


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

	// Retrieve UIViewController from routes.
	UIViewController *vctrl = [self.routes GetRouteUIViewController:Routes.productListView];

	[self addChildViewController: vctrl];
	[self.view addSubview: vctrl.view];
}

- (void) renderImportApp:(UIApplication *)app {
	UIWindow *window = ([UIApplication sharedApplication].delegate).window;
	// We need to store the original app view controller reference inorder
	// to restore game UI after closing importer app.
	self.gameRootViewController = window.rootViewController;

	// Override the app view.
	self.view.center = window.center;

	// Override the app controller.
	window.rootViewController = self;

	[window addSubview:self.view];
}

- (void) dealloc {
	self.routes = nil;
}

// Register event to close importer APP.
- (void)registerCloseImporterEvent {
	[
		[NSNotificationCenter defaultCenter]
			addObserver:self
				 selector:@selector(closeImporterObserver:)
						 name:@"notifyCloseImporter"
					 object:nil
	];
}

- (void)closeImporterObserver:(NSNotification *)notification {
	if ([[notification name] isEqualToString:@"notifyCloseImporter"]) {
		UIWindow *window = ([UIApplication sharedApplication].delegate).window;
		window.rootViewController = self.gameRootViewController;

		[self.view removeFromSuperview];
	}
}

// Handle close event
- (void) didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
