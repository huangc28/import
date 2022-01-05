#import "FrontBoard/FBProcess.h"
#import "Arknights/StoreKitManager.h"
#import "UIKit/UIKit.h"

#import "Lineage2MImporter.h"
#import "ArknightsImporter.h"
#import "LineageMLiveImporter.h"
#import "SnailImporter.h"

%ctor {
	NSLog(@"DEBUG* import extension started!");

	// 天堂 2 M
	InitLineage2MImporter();

	// 明日方舟
	InitArknightsImporter();

	// 天堂 M
	InitLineageMLiveImporter();

	// 最強蝸牛
	InitSnailImporter();
}
