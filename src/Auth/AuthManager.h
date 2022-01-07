#import "Foundation/Foundation.h"

@interface AuthManager :NSObject {
	NSString *_jwt;
}

+ (instancetype)sharedInstance;

@property(strong, nonatomic) NSString *jwt; // @synthesize jwt=_jwt

@end

