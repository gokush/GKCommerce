//
//  OrderItem.h
//  GKCommerce
//
//  Created by Goku on 14/12/2.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Store.h"
#import "Product.h"
#import "Order.h"

@interface OrderItem : NSObject

@property (weak, nonatomic) Store *store;
@property (weak, nonatomic) Product *product;
@property (weak, nonatomic) Order *order;
@property (assign, nonatomic) NSInteger itemID;
@property (assign, nonatomic) NSInteger quantity;
@property (strong, nonatomic) NSDecimalNumber *price;
@property (strong, nonatomic) NSDecimalNumber *shippingPrice;
@property (strong, nonatomic) NSDecimalNumber *lanedPrice;
@property (strong, nonatomic) NSDecimalNumber *listPrice;
@property (strong, nonatomic) NSDecimalNumber *totalPrice;

- (id)initWithOrder:(Order *)order;
@end
