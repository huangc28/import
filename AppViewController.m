#import "AppViewController.h"
#import "AppTopViewController.h"
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

	// We need topbar to handle loging.
	self.appTopViewController = [[AppTopViewController alloc] init];

	// We need to add username / password
	[self addChildViewController: self.appTopViewController];
	[self.view addSubview: self.appTopViewController.view];


	// Fetch remote product list and render into appView.

	// Initialize test UILabel here.
	//UILabel *tweakLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
	//tweakLabel.userInteractionEnabled = YES;
	//tweakLabel.backgroundColor = [UIColor whiteColor];
	//tweakLabel.text = @"TWEAK";
	//tweakLabel.font = [UIFont systemFontOfSize:25];
	//tweakLabel.textAlignment = NSTextAlignmentCenter;
	//[tweakLabel addGestureRecognizer:singleFingerTap];
	//singleFingerTap.delegate = self;

	//NSLog(@"DEBUG* tweakLabel isUserInteractionEnabled %hhd", tweakLabel.isUserInteractionEnabled);
	//[self.view addSubview:tweakLabel];
}

- (void)dealloc {
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
