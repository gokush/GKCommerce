//
//  Order.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-21.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartItem.h"
#import "Payment.h"
#import "Store.h"

typedef enum {
    OrderStatusUnConfirmed  = 0, // 未确认
    OrderStatusConfirmed    = 1, // 已确认
    OrderStatusCanceled     = 2, // 已取消
    OrderStatusInvalid      = 3, // 无效
    OrderStatusReturned     = 4, // 退货
    OrderStatusSplited      = 5, // 已分单
    OrderStatusSplitingPart = 6 // 部分分单
} OrderStatus;

typedef enum {
    GOOD_ORDER   = 1,//商品支付
    CHARGE_ORDER = 2 //充值支付
} OrderType;

@interface Order : NSObject

@property (strong, nonatomic) Store *store;
@property (assign, nonatomic) NSInteger orderID;
@property (strong, nonatomic) NSString *SN;
@property (strong, nonatomic) NSDate *createAt;
@property (strong, nonatomic) NSDecimalNumber *totalPrice;
@property (strong, nonatomic) NSMutableArray *shipping;
@property (strong, nonatomic) NSMutableArray *items;
@property (assign, nonatomic) NSInteger quantityOfProduct;
@property (strong, nonatomic) NSString *subject;
@property (strong, nonatomic) NSString *orderDescription;
@property (assign, nonatomic) OrderStatus status;
@property (strong, nonatomic) NSString *message;
@property (assign, nonatomic) Payment *payment;
@property (strong, nonatomic) NSDecimalNumber *paidMoney;
@property (strong, nonatomic) NSDecimalNumber *orderTotal;
@property (assign, nonatomic) NSInteger *orderType;

- (void)clear;
@end
