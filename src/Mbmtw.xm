#import "UIKit/UIKit.h"
#import "../../SharedLibraries/Alert.h"
#import "../UncleTuuImportCore/AppViewController.h"

%group MbmtwImporter
%hook UnityAppController
- (_Bool)application:(id)arg1 didFinishLaunchingWithOptions:(UIApplication*)app {
	dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 5);
	dispatch_after(delay, dispatch_get_main_queue(), ^(void){
		AppViewController *appViewController = [[AppViewController alloc] init];
		[appViewController renderImportApp];
	});

	return %orig;
}
%end
%end

extern "C" void InitMbmtwImporter() {
	%init(MbmtwImporter);
}
