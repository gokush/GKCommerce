//
//  AlipayUtility.h
// GKCommerce
//
//  Created by 小悟空 on 14-8-28.
//  Copyright (c) 2014年 小悟空. All rights reserved.
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
