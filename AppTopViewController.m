#import "UIKit/UIKit.h"

#import "SharedLibraries/HttpUtil.h"
#import "SharedLibraries/Product.h"

#import "AppTopViewController.h"
#import "AuthModel.h"

#include "Util.h"

@interface AppTopViewController ()<UITextFieldDelegate>
@end

@implementation AppTopViewController

@synthesize usernameTextField;
@synthesize passwordTextField;
@synthesize authModel;

- (id) init {
	authModel = [[AuthModel alloc] init];

	return [super init];
}

- (void) viewDidLoad {
	[super viewDidLoad];

	UIView *topBar = [
		[UIView alloc] initWithFrame:CGRectMake(
			0,
			0,
			[[UIScreen mainScreen] applicationFrame].size.width,
			80
		)
	];

	topBar.userInteractionEnabled = YES;

	topBar.backgroundColor = UIColorFromRGB(0x4A76F0);
	self.view = topBar;
	// self.usernameTextField.delegate = self;

	// Create username text field
	UITextField *utf = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 150, 50)];
  utf.backgroundColor = [UIColor whiteColor];
	utf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"用戶名"];
	[
		utf
			addTarget: self
				 action: @selector(usernameDidChange:)
				 forControlEvents: UIControlEventAllEditingEvents
	];
	self.usernameTextField = utf;
	self.usernameTextField.delegate = self;

	// Create password text field
	UITextField *ptf = [[UITextField alloc] initWithFrame:CGRectMake(180, 10, 150, 50)];
  ptf.backgroundColor = [UIColor whiteColor];
	ptf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密碼"];
	[
		ptf
			addTarget: self
				 action: @selector(passwordDidChange:)
				 forControlEvents: UIControlEventAllEditingEvents
	];
	self.passwordTextField = ptf;
	self.passwordTextField.delegate = self;

	// Create a button to submit auth credential
	UIButton *submitButton = [self createSubmitButton];

	[self.view addSubview: self.usernameTextField];
	[self.view addSubview: self.passwordTextField];
	[self.view addSubview: submitButton];
}


- (UIButton *) createSubmitButton {
	UIButton *but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[
		but
			addTarget: self
				 action: @selector(handleSubmit:)
				forControlEvents:UIControlEventTouchUpInside
	];
	[but setFrame: CGRectMake(400, 10, 50, 50)];
	[but setTitle: @"登入" forState: UIControlStateNormal];
	[but setTitleColor:[UIColor colorWithRed:36/255.0 green:71/255.0 blue:113/255.0 alpha:1.0] forState:UIControlStateNormal];
	[but setExclusiveTouch: YES];

	return but;
}

- (void)usernameDidChange:(UITextField *)arg1 {
	authModel.username = arg1.text;
}

- (void)passwordDidChange:(UITextField *)arg1 {
	authModel.password = arg1.text;
}

- (void) handleSubmit:(UIButton *)arg1 {
	NSString *username = authModel.username;
	NSString *password = authModel.password;

	NSLog(@"DEBUG* handle submit %@ %@", username, password);

}

@end


