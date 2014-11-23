//
//  PaymentBalance.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/4.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "Payment.h"

@interface PaymentBalance : Payment

@property (strong, nonatomic) NSDecimalNumber *amountOfMoney;
- (id)initWithAmountOfMoney:(NSDecimalNumber *)money;
@end
