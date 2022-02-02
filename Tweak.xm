#import "src/Lineage2MImporter.h"
#import "src/ArknightsImporter.h"
#import "src/LineageMLiveImporter.h"
#import "src/SnailImporter.h"
#import "src/Mbmtw.h"

// TODO
//   - NSNotificationCenter event name should be extracted to constant.
%ctor {
	NSLog(@"DEBUG* import extension started");

	// 天堂 2 M
	InitLineage2MImporter();

	// 明日方舟
	InitArknightsImporter();

	// 天堂 M
	InitLineageMLiveImporter();

	// 最強蝸牛
	InitSnailImporter();

	// 天涯明月刀
	InitMbmtwImporter();
}
