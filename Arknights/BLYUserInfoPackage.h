//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "BLYJceObjectV2.h"

@class NSArray, NSDictionary, NSString;

@interface BLYUserInfoPackage : BLYJceObjectV2
{
    BOOL jcev2_p_0_r_type;
    NSString *jcev2_p_1_o_proceName;
    NSString *jcev2_p_2_o_deviceId;
    NSArray *jcev2_p_3_o_list__b0x9i_VOBLYSummaryInfo;
    NSDictionary *jcev2_p_4_o_valueMap__b0x9i_M09ONSStringONSString;
}

+ (id)jceType;
+ (void)initialize;
@property(retain, nonatomic, getter=jce_valueMap, setter=setJce_valueMap:) NSDictionary *jcev2_p_4_o_valueMap__b0x9i_M09ONSStringONSString; // @synthesize jcev2_p_4_o_valueMap__b0x9i_M09ONSStringONSString;
@property(retain, nonatomic, getter=jce_list, setter=setJce_list:) NSArray *jcev2_p_3_o_list__b0x9i_VOBLYSummaryInfo; // @synthesize jcev2_p_3_o_list__b0x9i_VOBLYSummaryInfo;
@property(retain, nonatomic, getter=jce_deviceId, setter=setJce_deviceId:) NSString *jcev2_p_2_o_deviceId; // @synthesize jcev2_p_2_o_deviceId;
@property(retain, nonatomic, getter=jce_proceName, setter=setJce_proceName:) NSString *jcev2_p_1_o_proceName; // @synthesize jcev2_p_1_o_proceName;
@property(nonatomic, getter=jce_type, setter=setJce_type:) BOOL jcev2_p_0_r_type; // @synthesize jcev2_p_0_r_type;
- (void).cxx_destruct;
- (id)init;

@end

