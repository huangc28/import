#import "Foundation/Foundation.h"
#import "StoreKit/StoreKit.h"
#import "UIKit/UIKit.h"

#import "SharedLibraries/Alert.h"

#import "ProductListViewContainerViewController.h"
#import "Auth/AuthManager.h"
#import "AppTopViewController.h"
#import "ProductListViewController.h"
#import "AppBottomViewController.h"

@interface ProductListViewContainerViewController ()<UIGestureRecognizerDelegate>
@end

@implementation ProductListViewContainerViewController

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

	// Add TopBarViewController
	self.appTopViewController = [[AppTopViewController alloc] init];
	[self addChildViewController: self.appTopViewController];
	[self.view addSubview: self.appTopViewController.view];

	// Add ProductListViewController
	self.productListViewController = [[ProductListViewController alloc]	init];
	[self addChildViewController: self.productListViewController];
	[self.view addSubview: self.productListViewController.view];

	// Add AppBottomViewController
	self.appBottomViewController = [[AppBottomViewController alloc] init];
	[self addChildViewController:self.appBottomViewController];
	[self.view addSubview:self.appBottomViewController.view];

	[self registerInappPaymentEvent];
	//[self registerCloseImporterEvent];
	[self registerTogglePurchasedRecordsViewEvent];

	// Assign a payment observer so we can store item transaction info.
	self.vbStoreKitManager = [[VBStoreKitManager alloc] init];

	[[SKPaymentQueue defaultQueue] addTransactionObserver:self.vbStoreKitManager];

}

// Register event to perform in app purchase in importer app
- (void)registerInappPaymentEvent {
	[
		[NSNotificationCenter defaultCenter]
			addObserver:self
				 selector:@selector(inappPaymentObserver:)
						 name:@"notifyInappPayment"
					 object:nil
	];
}

// Register event to close importer APP.
//- (void)registerCloseImporterEvent {
	//[
		//[NSNotificationCenter defaultCenter]
			//addObserver:self
				 //selector:@selector(closeImporterObserver:)
						 //name:@"notifyCloseImporter"
					 //object:nil
	//];
//}

- (void)registerTogglePurchasedRecordsViewEvent {
	[
		[NSNotificationCenter defaultCenter]
			addObserver:self
				 selector:@selector(togglePurchasedRecordsViewObserver:)
						 name:@"notifyTogglePurchasedRecordsView"
					 object:nil
	];
}


- (void)inappPaymentObserver:(NSNotification *)notification {
	if ([[notification name] isEqualToString:@"notifyInappPayment"]) {
		// Check if user has logged in to the system.
		AuthManager *authManager = [AuthManager sharedInstance];

		if (![authManager isLoggedIn]) {
			[
				Alert
					show:^(){
						NSLog(@"DEBUG* login before importing product");
					}
					title: @"[尚未登入]"
					message: @"登入後才能入庫喔"
			];

			return;
		}

		// Start inapp payment.
		NSDictionary *userInfo = notification.userInfo;
		NSString *nProdID = [userInfo objectForKey:@"prodID"];
		SKMutablePayment *payment =[[SKMutablePayment alloc] init];
		payment.productIdentifier = nProdID;
		[[SKPaymentQueue defaultQueue] addPayment:payment];
	}
}

//- (void)closeImporterObserver:(NSNotification *)notification {
	//if ([[notification name] isEqualToString:@"notifyCloseImporter"]) {
		//UIWindow *window = ([UIApplication sharedApplication].delegate).window;
		//window.rootViewController = self.gameRootViewController;

		//[self.view removeFromSuperview];
	//}
//}

- (void)togglePurchasedRecordsViewObserver:(NSNotification *)notification {
	NSLog(@"DEBUG* togglePurchasedRecordsViewObserver");
}

// The event handling method
- (void)handleTap:(UITapGestureRecognizer *)recognizer {
	[self.appTopViewController dismissKeyboard];
}

@end
