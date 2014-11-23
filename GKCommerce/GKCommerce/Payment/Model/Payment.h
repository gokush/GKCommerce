//
//  Payment.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/3.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PaymentTypeNone,
    PaymentTypeUserBalance,
    PaymentTypeAlipay,
    PaymentTypeCashOnDelivery
} PaymentType;

@interface Payment : NSObject

@property (assign, nonatomic) NSInteger paymentID;
@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) BOOL cashOnDelivery;
@property (assign, nonatomic) PaymentType type;
@end
