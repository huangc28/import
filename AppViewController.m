#import "StoreKit/StoreKit.h"

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

	self.productListViewController = [[ProductListViewController alloc]	init];
	[self addChildViewController: self.productListViewController];
	[self.view addSubview: self.productListViewController.view];

	// Listen to pay event to initialize inapp payment.
	[
		[NSNotificationCenter defaultCenter]
			addObserver:self
				 selector:@selector(inappPaymentObserver:)
						 name:@"notifyInappPayment"
					 object:nil
	];

	// Assign a payment observer so we can store item transaction info.
	self.vbStoreKitManager = [[VBStoreKitManager alloc] init];

	[[SKPaymentQueue defaultQueue] addTransactionObserver:self.vbStoreKitManager];

}

- (void) dealloc {
	self.appTopViewController = nil;
	self.productListViewController = nil;
}

- (void) renderImportApp:(UIApplication *)app {
		UIWindow *window = app.keyWindow;

		// Override the app view.
		self.view.center = window.center;

		// Override the app controller.
		window.rootViewController = self;

		[window addSubview:self.view];
}

- (void)inappPaymentObserver:(NSNotification *)notification {
	NSURL *receiptURL = [[NSBundle mainBundle] appStoreReceiptURL];

	NSLog(@"DEBUG* receiptURL %@", receiptURL);

	if ([[notification name] isEqualToString:@"notifyInappPayment"]) {
		NSDictionary *userInfo = notification.userInfo;
		NSString *nProdID = [userInfo objectForKey:@"prodID"];

		// Initialize inapp payment.
		SKMutablePayment *payment =[[SKMutablePayment alloc] init];
		payment.productIdentifier = nProdID;
    [[SKPaymentQueue defaultQueue] addPayment:payment];
	}
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
