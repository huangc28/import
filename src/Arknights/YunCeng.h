//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@class YCNetDiagnoService;

@interface YunCeng : NSObject
{
    YCNetDiagnoService *_netDiagnoService;
}

+ (int)GetSession:(char *)arg1:(int)arg2;
+ (int)whiteboxEncrypt:(const char *)arg1:(int)arg2:(char *)arg3:(int)arg4;
+ (int)safeDecrypt:(const char *)arg1:(int)arg2:(char *)arg3:(int)arg4;
+ (int)safeEncrypt:(const char *)arg1:(int)arg2:(char *)arg3:(int)arg4;
+ (int)whiteboxSign:(const char *)arg1:(int)arg2:(char *)arg3:(int)arg4;
+ (int)securityInit:(const char *)arg1;
+ (int)reportUserData:(int)arg1:(const char *)arg2:(int)arg3;
+ (void)startNetworkDiagnosis:(id)arg1 port:(int)arg2 callback:(CDUnknownBlockType)arg3;
+ (int)startNetworkDiagnosisInner:(id)arg1 port:(int)arg2 callback:(CDUnknownBlockType)arg3;
+ (int)NetworkDiagnosiTask;
+ (int)getLocalIpInfo:(char *)arg1:(int)arg2:(char *)arg3:(int)arg4;
+ (int)getProxyUdpByDomain:(const char *)arg1:(const char *)arg2:(const char *)arg3:(const char *)arg4:(char *)arg5:(int)arg6:(char *)arg7:(int)arg8;
+ (int)getProxyUdpByIp:(const char *)arg1:(const char *)arg2:(const char *)arg3:(const char *)arg4:(char *)arg5:(int)arg6:(char *)arg7:(int)arg8;
+ (int)getProxyTcpByDomain:(const char *)arg1:(const char *)arg2:(const char *)arg3:(const char *)arg4:(char *)arg5:(int)arg6:(char *)arg7:(int)arg8;
+ (int)getProxyTcpByIp:(const char *)arg1:(const char *)arg2:(const char *)arg3:(const char *)arg4:(char *)arg5:(int)arg6:(char *)arg7:(int)arg8;
+ (int)initEx:(const char *)arg1:(const char *)arg2;
- (void).cxx_destruct;

@end
