#import "FrontBoard/FBProcess.h"
#import "Arknights/StoreKitManager.h"
#import "UIKit/UIKit.h"

#import "Lineage2MImporter.h"
#import "ArknightsImporter.h"
#import "LineageMLiveImporter.h"

%ctor {
	NSLog(@"DEBUG* vendorbuy extension");

	InitLineage2MImporter();

	InitArknightsImporter();

	InitLineageMLiveImporter();
}
