#import "FrontBoard/FBProcess.h"
#import "Arknights/StoreKitManager.h"
#import "UIKit/UIKit.h"

#import "Lineage2MImporter.h"
#import "ArknightsImporter.h"
#import "LineageMLiveImporter.h"

// Seems like we need to extract 傳說對決 to an independent tweak.
// #import "KgtwImporter.h"

%ctor {
	NSLog(@"DEBUG* import extension");

	// 天堂 2 M
	InitLineage2MImporter();

	// 明日方舟
	InitArknightsImporter();

	// 天堂 M
	InitLineageMLiveImporter();

	// 傳說對決
	// InitKgtwImporter();
}
