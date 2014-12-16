//
//  Order.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-21.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "Order.h"

@implementation Order

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)clear
{
    self.orderID = 0;
    self.SN = @"";
    self.totalPrice = [[NSDecimalNumber alloc] initWithString:@"0.00"];
    self.subject = @"";
    self.orderDescription = @"";
    self.message = @"";
}

@end
