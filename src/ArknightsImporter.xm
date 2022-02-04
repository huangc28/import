#import "UIKit/UIKit.h"

#import "../UncleTuuImportCore/AppViewController.h"

%group ArknightsImporter

%hook StoreKitManager

- (id)init {
	// Try initiate application here.
	id r = %orig;

	static dispatch_once_t once;
	dispatch_once(&once, ^{
		AppViewController *appViewController = [[AppViewController alloc] init];

		UIApplication *app = [UIApplication sharedApplication];

		[appViewController renderImportApp:app];
	});


	return r;
}
%end

%end

extern "C" void InitArknightsImporter() {
	%init(ArknightsImporter);
}
