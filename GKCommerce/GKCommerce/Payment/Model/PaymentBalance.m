//
//  PaymentBalance.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/4.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "PaymentBalance.h"

@implementation PaymentBalance

- (id)initWithAmountOfMoney:(NSDecimalNumber *)money
{
    self = [super init];
    if (self) {
        self.amountOfMoney = money;
    }
    return self;
}
@end
