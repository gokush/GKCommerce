//
//  AlipayUtility.m
//  mst
//
//  Created by 魏琮举 on 14-8-28.
//  Copyright (c) 2014年 魏琮举. All rights reserved.
//

#import "AlipayUtility.h"

@implementation AlipayUtility

// TODO: miss notify URL
- (NSString *)payOrderRequestBody:(Order *)order
{
    NSString *urlStr =  @"";

    AlixPayOrder *alipayOrder = [[AlixPayOrder alloc] init];
    alipayOrder.partner = PartnerID;
    alipayOrder.seller = SellerID;

    alipayOrder.tradeNO = order.SN;
	alipayOrder.productName = order.subject;
	alipayOrder.productDescription = order.description;
	alipayOrder.amount = [NSString stringWithFormat:@"%@", order.totalPrice];
	alipayOrder.notifyURL =  urlStr ;
    alipayOrder.extraParams = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                               [NSNumber numberWithInteger:order.orderID],@"order_id",
                               [NSNumber numberWithInteger:GOOD_ORDER],@"order_type",
                               nil];

    id<DataSigner> signer;
    signer = CreateRSADataSigner(PartnerPrivKey);
    NSString *signedBody = [signer signString:[alipayOrder description]];
    
    return [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
            alipayOrder.description, signedBody, @"RSA"];
    
}

- (NSString *)chargeOrderRequestBody:(NSDictionary *)JSON
{
    NSString *urlStr = @"";
    AlixPayOrder *alipayOrder = [[AlixPayOrder alloc] init];
    alipayOrder.partner = PartnerID;
    alipayOrder.seller = SellerID;
    
    alipayOrder.tradeNO = [JSON objectForKey:@"order_sn"];
	alipayOrder.productName = @"余额充值";
	alipayOrder.productDescription = @"余额充值";
    NSDecimalNumber *amount = [NSDecimalNumber decimalNumberWithString:[JSON objectForKey:@"order_amount"]];
    alipayOrder.amount = [amount stringValue];
	alipayOrder.notifyURL =  urlStr ;
    alipayOrder.extraParams = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                               [JSON objectForKey:@"order_sn"],@"order_id",
                               [NSNumber numberWithInteger:CHARGE_ORDER],@"order_type",
                               nil];

    id<DataSigner> signer;
    signer = CreateRSADataSigner(PartnerPrivKey);
    NSString *signedBody = [signer signString:[alipayOrder description]];
    
    return [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
            alipayOrder.description, signedBody, @"RSA"];
}

+ (AlipayUtility *)shared
{
    static AlipayUtility *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}

@end
