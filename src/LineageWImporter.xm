#import "../UncleTuuImportCore/AppViewController.h"
#import "GameBundleIDs.h"

%group LineageWImporter

%hook IOSAppDelegate
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2 {
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:LineageW]) {
		dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 5);

		dispatch_after(delay, dispatch_get_main_queue(), ^(void){
			AppViewController *appViewController = [[AppViewController alloc] init];
			[appViewController renderImportApp];
		});
	}

	return %orig;
}
%end

%end

extern "C" void InitLineageWImporter() {
	%init(LineageWImporter);
}
