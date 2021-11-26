#import "AppViewController.h"

@implementation AppViewController

- (IBAction) setTitleLabel:(id)sender {
	[testLabel setText:@"Hello"];
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

	self.view = appView;

	// Initialize test UILabel here.
	UILabel *tweakLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
	tweakLabel.backgroundColor = [UIColor whiteColor];
	tweakLabel.text = @"TWEAK";
	tweakLabel.font = [UIFont systemFontOfSize:25];
	tweakLabel.textAlignment = NSTextAlignmentCenter;

	[self.view addSubview:tweakLabel];
	// Add tweakLabel to appView
	NSLog(@"DEBUG* AppViewController viewDidLoad %@", self.view);
}

- (void) didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
