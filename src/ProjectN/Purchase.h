@interface Purchase : NSObject
{
    NSString *_transactionId;
    NSString *_storeType;
    NSString *_applicationId;
    NSString *_productId;
    NSString *_transactionIdOnMarket;
    NSString *_currencyCodeOnMarket;
    NSString *_amountMicrosOnMarket;
    NSString *_ipaddr;
    NSString *_date;
    NSString *_receipt;
    NSString *_adid;
    NSString *_sdkVersion;
    NSString *_platformId;
    NSString *_nmDeviceKey;
    NSString *_productTypeCd;
    NSString *_idfv;
    NSString *_storeCountry;
}

@property(retain, nonatomic) NSString *storeCountry; // @synthesize storeCountry=_storeCountry;
@property(retain, nonatomic) NSString *idfv; // @synthesize idfv=_idfv;
@property(retain, nonatomic) NSString *productTypeCd; // @synthesize productTypeCd=_productTypeCd;
@property(retain, nonatomic) NSString *nmDeviceKey; // @synthesize nmDeviceKey=_nmDeviceKey;
@property(retain, nonatomic) NSString *platformId; // @synthesize platformId=_platformId;
@property(retain, nonatomic) NSString *sdkVersion; // @synthesize sdkVersion=_sdkVersion;
@property(retain, nonatomic) NSString *adid; // @synthesize adid=_adid;
@property(retain, nonatomic) NSString *receipt; // @synthesize receipt=_receipt;
@property(retain, nonatomic) NSString *date; // @synthesize date=_date;
@property(retain, nonatomic) NSString *ipaddr; // @synthesize ipaddr=_ipaddr;
@property(retain, nonatomic) NSString *amountMicrosOnMarket; // @synthesize amountMicrosOnMarket=_amountMicrosOnMarket;
@property(retain, nonatomic) NSString *currencyCodeOnMarket; // @synthesize currencyCodeOnMarket=_currencyCodeOnMarket;
@property(retain, nonatomic) NSString *transactionIdOnMarket; // @synthesize transactionIdOnMarket=_transactionIdOnMarket;
@property(retain, nonatomic) NSString *productId; // @synthesize productId=_productId;
@property(retain, nonatomic) NSString *applicationId; // @synthesize applicationId=_applicationId;
@property(retain, nonatomic) NSString *storeType; // @synthesize storeType=_storeType;
@property(retain, nonatomic) NSString *transactionId; // @synthesize transactionId=_transactionId;
- (_Bool)isEqualTo:(id)arg1;
- (id)toJSONString;
- (id)getDictionary;
- (void)print;
- (id)initWithDictionary:(id)arg1;

@end

