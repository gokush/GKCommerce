//
//  AlipayDelegate.h
// GKCommerce
//
//  Created by 小悟空 on 14-9-19.
//  Copyright (c) 2014年 MST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Order.h"

@class Alipay;
@protocol AlipayDelegate <NSObject>

- (void)alipay:(Alipay *)anAlipay didSuccess:(Order *)order;
- (void)alipay:(Alipay *)anAlipay didFailure:(Order *)order;
@end
