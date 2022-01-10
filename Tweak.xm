#import "src/Lineage2MImporter.h"
#import "src/ArknightsImporter.h"
#import "src/LineageMLiveImporter.h"
#import "src/SnailImporter.h"

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
