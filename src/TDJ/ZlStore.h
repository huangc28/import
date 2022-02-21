//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

// #import <objc/NSObject.h>

// #import "SKPaymentTransactionObserver-Protocol.h"
// #import "SKRequestDelegate-Protocol.h"

// @class NSMutableDictionary, NSMutableSet, NSString, SKReceiptRefreshRequest;
// @protocol RMStoreReceiptVerificator, RMStoreTransactionPersistor;

@interface ZlStore : NSObject
{
    NSMutableDictionary *_addPaymentParameters;
    NSMutableDictionary *_products;
    NSMutableSet *_productsRequestDelegates;
    long long _pendingRestoredTransactionsCount;
    _Bool _restoredCompletedTransactionsFinished;
    SKReceiptRefreshRequest *_refreshReceiptRequest;
    id _refreshReceiptFailureBlock;
    id _refreshReceiptSuccessBlock;
    id _restoreTransactionsFailureBlock;
    id _restoreTransactionsSuccessBlock;
    //id <RMStoreReceiptVerificator> _receiptVerificator;
    //id <RMStoreTransactionPersistor> _transactionPersistor;

    id _receiptVerificator;
    id _transactionPersistor;
}

@property(nonatomic) __weak id transactionPersistor; // @synthesize transactionPersistor=_transactionPersistor;
@property(nonatomic) __weak id receiptVerificator; // @synthesize receiptVerificator=_receiptVerificator;
@end