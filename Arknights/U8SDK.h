//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@class NSDictionary, NSMutableArray, NSString;

@interface U8SDK : NSObject
{
    NSMutableArray *plugins;
    id <U8SDKDelegate> delegate;
    NSDictionary *_sdkParams;
    long long _supportedOrientations;
    id _defaultUser;
    id _defaultPay;
    id _defaultExternalTools;
}

+ (id)encodeHttpParams:(id)arg1 encode:(unsigned long long)arg2;
+ (id)sharedInstance;
@property(retain, nonatomic) id defaultExternalTools; // @synthesize defaultExternalTools=_defaultExternalTools;
@property(retain, nonatomic) id defaultPay; // @synthesize defaultPay=_defaultPay;
@property(retain, nonatomic) id defaultUser; // @synthesize defaultUser=_defaultUser;
@property long long supportedOrientations; // @synthesize supportedOrientations=_supportedOrientations;
@property(copy, nonatomic) NSDictionary *sdkParams; // @synthesize sdkParams=_sdkParams;
- (void).cxx_destruct;
- (_Bool)application:(id)arg1 openURL:(id)arg2 options:(id)arg3;
- (_Bool)application:(id)arg1 handleOpenURL:(id)arg2;
- (_Bool)application:(id)arg1 openURL:(id)arg2 sourceApplication:(id)arg3 annotation:(id)arg4;
- (void)application:(id)arg1 didReceiveRemoteNotification:(id)arg2;
- (void)application:(id)arg1 didReceiveLocalNotification:(id)arg2;
- (void)application:(id)arg1 didFailToRegisterForRemoteNotificationsWithError:(id)arg2;
- (void)application:(id)arg1 didRegisterForRemoteNotificationsWithDeviceToken:(id)arg2;
- (void)applicationWillTerminate:(id)arg1;
- (void)applicationDidBecomeActive:(id)arg1;
- (void)applicationWillEnterForeground:(id)arg1;
- (void)applicationDidEnterBackground:(id)arg1;
- (void)applicationWillResignActive:(id)arg1;
- (_Bool)application:(id)arg1 continueUserActivity:(id)arg2 restorationHandler:(CDUnknownBlockType)arg3;
- (void)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2;
- (const char *)getSDKMeta;
- (void)submitExtraData:(id)arg1;
- (void)setupWithParams:(id)arg1;
- (id)plugins;
- (id)getInterfaceByName:(id)arg1 andProtocol:(id)arg2;
- (void)registerPlugin:(id)arg1;
- (id)GetViewController;
- (id)GetView;
- (_Bool)isInitCompleted;
- (_Bool)IsSupportFunction:(SEL)arg1;
@property(readonly) NSString *channelName;
@property(readonly) int channelId;
- (void)initWithParams:(id)arg1;
- (id)init;
- (void)setDelegate:(id)arg1;
- (void)PayValidate:(id)arg1 responseHandler:(CDUnknownBlockType)arg2;
- (void)requestOrder:(id)arg1 userID:(id)arg2 responseHandler:(CDUnknownBlockType)arg3;
- (void)AccountValidate:(id)arg1 responseHandler:(CDUnknownBlockType)arg2;
- (id)stringMd5:(id)arg1;

@end

