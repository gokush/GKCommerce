//
//  CheckoutUsingAlipay.h
//  mst
//
//  Created by 魏琮举 on 14-9-1.
//  Copyright (c) 2014年 MST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Order.h"
#import "AlipayDelegate.h"

// Discuss
// CheckoutUsingAlipay 维持结算过程中的状态
// Alipay sdk会在结算时丢失结算时的状态

@interface Alipay : NSObject

@property (strong, nonatomic) Order *order;
@property (strong, nonatomic) id<AlipayDelegate> delegate;
- (id)initWithOrder:(Order *)order;
- (void)pay;
@end
