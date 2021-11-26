#import "ViewController.h"

@implementation AppViewController

- (IBAction) setTitleLabel:(id)sender {
	[testLabel setText:@"Hello"];
}

- (void) viewDidLoad {
	[super viewDidLoad];
}

- (void) didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]
}

@end
