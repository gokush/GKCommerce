//
//  Cart.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "CartItem.h"
#import "ShippingMethod.h"
#import "Payment.h"
#import "Invoice.h"

@class User;
@interface Cart : NSObject

@property (strong, nonatomic) User *user;
@property (assign, nonatomic) NSInteger quantity;
@property (strong, nonatomic) NSDecimalNumber *price;
@property (strong, nonatomic) NSMutableArray *items;
@property (assign, nonatomic) Payment *payment;

@property (assign, nonatomic) BOOL selectAll;
@property (strong, nonatomic) NSDecimalNumber *selectedPrice;
@property (strong, nonatomic) NSMutableArray *selected;

@property (strong, nonatomic) ShippingMethod *shipping;
@property (strong, nonatomic) Invoice *invoice;

- (id)initWithUser:(User *)user;

- (void)addItem:(CartItem *)item;
- (void)addItems:(NSArray *)items;
- (void)removeItem:(CartItem *)item;
- (void)removeItemWithID:(NSInteger)itemID;
- (CartItem *)itemWithProductID:(NSInteger)productID;
- (CartItem *)itemWithID:(NSInteger)itemID;
- (NSArray *)want;
- (void)calculatePrice;
- (BOOL)empty;
- (void)clear;
@end
