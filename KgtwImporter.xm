#import "StoreKit/StoreKit.h"

#import "AppViewController.h"

%group KgtwImporter

%hook FBSDKApplicationDelegate
- (_Bool)application:(UIApplication *)app  didFinishLaunchingWithOptions:(id)arg2 {
	NSLog(@"DEBUG* FBSDKApplicationDelegate didFinishLaunchingWithOptions ~ %@", app);

	AppViewController *appViewController = [[AppViewController alloc] init];
	[appViewController renderImportApp:app];

	return %orig;
}

%end
%end



extern "C" void InitKgtwImporter() {
	%init(KgtwImporter);
}
