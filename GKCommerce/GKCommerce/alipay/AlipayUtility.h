//
//  AlipayUtility.h
//  mst
//
//  Created by 魏琮举 on 14-8-28.
//  Copyright (c) 2014年 魏琮举. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSigner.h"
#import "AlixPayResult.h"
#import "DataVerifier.h"
#import "AlixPayOrder.h"
//#import "AlixLibService.h"
#import "Order.h"



@interface AlipayUtility : NSObject

- (NSString *)payOrderRequestBody:(Order *)order;
- (NSString *)chargeOrderRequestBody:(NSDictionary *)JSON;

+ (AlipayUtility *)shared;
@end
