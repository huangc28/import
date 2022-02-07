#import "UIKit/UIKit.h"

#import "../UncleTuuImportCore/AppViewController.h"

%group MaplestoryImporter
%hook AppController
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(UIApplication*)app {
	NSLog(@"DEBUG* maple story didFinishLaunchingWithOptions");

	static dispatch_once_t once;

	dispatch_once(&once, ^{
		AppViewController *appViewController = [[AppViewController alloc] init];
		[appViewController renderImportApp];
	});

	return %orig;
}
%end
%end

extern "C" void InitMaplestoryImporter() {
	%init(MaplestoryImporter);
}
