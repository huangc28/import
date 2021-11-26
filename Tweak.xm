#import "Arknights/StoreKitManager.h"
#import "UIKit/UIKit.h"

%group Hooks
%hook StoreKitManager

- (id)init {
	// Try initiate application here.
	id r = %orig;

	static dispatch_once_t once;
	dispatch_once(&once, ^{
		// App view should be the full size of the viewport.
		UIView *appSquareView = [
			[UIView alloc] initWithFrame:CGRectMake(
				0,
				0,
				[[UIScreen mainScreen] applicationFrame].size.width,
				[[UIScreen mainScreen] applicationFrame].size.height
			)
		];

		// Background color should be white.
		appSquareView.backgroundColor = [UIColor whiteColor];

		UILabel *tweakLabel = [[UILabel alloc] initWithFrame:appSquareView.bounds];
		tweakLabel.backgroundColor = [UIColor clearColor];
		tweakLabel.text = @"TWEAK";
		tweakLabel.font = [UIFont systemFontOfSize:25];
		tweakLabel.textAlignment = NSTextAlignmentCenter;
		[appSquareView addSubview:tweakLabel];

		UIWindow *window = [UIApplication sharedApplication].keyWindow;
		NSLog(@"DEBUG* app key window %@", window);
		appSquareView.center = window.center;
    [window addSubview:appSquareView];
	});

	NSLog(@"DEBUG* StoreKitManager init");

	return r;
}
%end
%end


%ctor {
	NSLog(@"DEBUG* vendorbuy extension");

	%init(Hooks);
}
