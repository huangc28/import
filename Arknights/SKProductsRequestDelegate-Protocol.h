//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

// #import "SKRequestDelegate.h"
#import "SKRequestDelegate-Protocol.h"

@class SKProductsRequest, SKProductsResponse;
@protocol SKRequestDelegate;

@protocol SKProductsRequestDelegate <SKRequestDelegate>
- (void)productsRequest:(SKProductsRequest *)arg1 didReceiveResponse:(SKProductsResponse *)arg2;
@end

