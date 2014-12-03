//
//  CheckoutUsingAlipay.m
//  mst
//
//  Created by 魏琮举 on 14-9-1.
//  Copyright (c) 2014年 MST. All rights reserved.
//

#import "Alipay.h"
#import "AlipayUtility.h"
#import "AlipayResponse.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>


@implementation Alipay

- (id)initWithOrder:(Order *)order
{
    self = [super init];
    if (self) {
        self.order = order;
    }
    
    return self;
}

- (void)pay
{
    NSString *requestBody = [[[AlipayUtility alloc] init]
                             payOrderRequestBody:self.order];
    NSLog(@"%@", requestBody);

    
    
    [[AlipaySDK defaultService] payOrder:requestBody fromScheme:@"mst365"
                                callback:^(NSDictionary *resultDic) {
        [self didReceivePayment:resultDic];
    }];
    
}

- (void)didReceivePayment:(NSDictionary *)resultDic
{
    //结果处理
    AlixPayResult* result = [[AlixPayResult alloc] initWithDict:resultDic];
    AlipayResponse *response = [AlipayResponse responseWithResult:result];
    
    NSLog(@"%@",self.order);
    response.order = self.order;
    
    if ([response valid:AlipayPubKey]) {
        if ([self.delegate respondsToSelector:@selector(alipay:didSuccess:)]) {
            [self.delegate alipay:self didSuccess:self.order];
        }
    } else {
        if ([self.delegate respondsToSelector:@selector(alipay:didFailure:)]) {
            [self.delegate alipay:self didFailure:self.order];
        }
    }
    
    //	if (result) {
    //		if (result.statusCode == 9000) {
    //			/*
    //			 *用公钥验证签名 严格验证请使用result.resultString与result.signString验签
    //			 */
    //            //交易成功
    //            NSString* key = AlipayPubKey;//签约帐户后获取到的支付宝公钥
    //			id<DataVerifier> verifier;
    //            verifier = CreateRSADataVerifier(key);
    //
    //			if ([verifier verifyString:result.resultString
    //                              withSign:result.signString]) {
    //                //验证签名成功，交易结果无篡改
    //                [self gotoPaymentSuccess:[response order]];
    //			}
    //        } else {
    //            //交易失败
    //        }
    //    } else {
    //        //失败
    //    }
}
@end
