#import "AppBottomViewController.h"

#import "Util.h"

@implementation AppBottomViewController

- (void) viewDidLoad {
	[super viewDidLoad];
	// Create bottom view
	UIView *bottomBarView = [
		[UIView alloc] initWithFrame:CGRectMake(
			0,
			[UIScreen mainScreen].bounds.size.height - 70.0,
			[UIScreen mainScreen].bounds.size.width,
			70
		)
	];
	bottomBarView.userInteractionEnabled = YES;
	bottomBarView.backgroundColor = UIColorFromRGB(0x4A76F0);
	self.view = bottomBarView;

	UIButton *closeButton = [self createButton:@"關閉"];
	UIButton *purchaseRecordButton = [self createButton:@"購買紀錄列表"];
	UIButton *uploadFailedListButton = [self createButton:@"上傳失敗列表"];
	UIButton *refreshButton = [self createButton:@"更新"];


	// Create close button
	UIStackView *bottomBarContent = [self createBottomBar];
	[self.view addSubview:bottomBarContent];
	[self configureBottomBarContent:bottomBarContent];

	// TODO configure button events.

	[bottomBarContent addArrangedSubview:closeButton];
	[bottomBarContent addArrangedSubview:purchaseRecordButton];
	[bottomBarContent addArrangedSubview:uploadFailedListButton];
	[bottomBarContent addArrangedSubview:refreshButton];
}

- (void)configureBottomBarContent:(UIStackView *)bottomBarContent {
	@try {
		[bottomBarContent.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
		[bottomBarContent.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
		[bottomBarContent.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
		[bottomBarContent.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
	} @catch (NSException *exception) {
		NSLog(@"DEBUG* configureBottomBarContent %@", exception);
	}
}

- (UIStackView *)createBottomBar {
	UIStackView *bottomBarContent = [[UIStackView alloc] init];
	bottomBarContent.axis = UILayoutConstraintAxisHorizontal;
	bottomBarContent.distribution = UIStackViewDistributionFillEqually;
	bottomBarContent.translatesAutoresizingMaskIntoConstraints = NO;

	return bottomBarContent;
}

- (UIButton *) createButton:(NSString* )title {

	UIButton *but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[
		but
			addTarget: self
				 action: @selector(handleSubmit:)
				forControlEvents:UIControlEventTouchUpInside
	];

	[but setTitle:title forState: UIControlStateNormal];
	[but setTitleColor:[UIColor colorWithRed:36/255.0 green:71/255.0 blue:113/255.0 alpha:1.0] forState:UIControlStateNormal];
	[but setExclusiveTouch: YES];

	return but;
}

@end
