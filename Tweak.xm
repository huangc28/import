#import "src/Lineage2MImporter.h"
#import "src/LineageMLiveImporter.h"
#import "src/LineageWImporter.h"
#import "src/ArknightsImporter.h"
#import "src/SnailImporter.h"
#import "src/Mbmtw.h"
#import "src/HarryPotterImporter.h"
#import "src/Maplestory.h"
#import "src/CrownImporter.h"

// ----- Not supported -----
#import "src/TdjImporter.h"
//#import "src/MighttcImporter.h"
#import "src/ProjectNImporter.h"
//#import "src/CallMeBigBossImporter.h"

// TODO
//   - NSNotificationCenter event name should be extracted to constant.
%ctor {
	NSLog(@"DEBUG* import extension started");

	// 天堂 2 M
	InitLineage2MImporter();

	// 天堂 M
	InitLineageMLiveImporter();

	// 天堂 W
	InitLineageWImporter();

	// 明日方舟
	InitArknightsImporter();

	// 最強蝸牛 (Not supported)
	//InitSnailImporter();

	// 天涯明月刀
	InitMbmtwImporter();

	// 哈利波特
	InitHarryPotterImporter();

	// 楓之谷: R
	InitMaplestoryImporter();

	// 放置英雄
	InitCrownImporter();

	// 天地劫 (Not supprted)
	// InitTdjImporter();

	// 三國志 霸道 (Not supported)
	// InitMighttcImporter();

	// 二之國 (Not supprted)
	// InitProjectNImporter();

	// 叫我大掌櫃 (Not supprted)
	// InitCallMeBigBossImporter();
}
