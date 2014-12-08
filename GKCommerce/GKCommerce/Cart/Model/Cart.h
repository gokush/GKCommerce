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

@property (weak, nonatomic) User *user;
@property (strong, nonatomic) NSDecimalNumber *price;
@property (strong, nonatomic) NSMutableArray *itemsOfStore;
@property (strong, nonatomic) NSMutableArray *selected;
@property (assign, nonatomic) Payment *payment;
@property (strong, nonatomic) NSDecimalNumber *selectedPrice;
@property (strong, nonatomic) ShippingMethod *shipping;
@property (strong, nonatomic) Invoice *invoice;

- (id)initWithUser:(User *)user;
- (NSArray *)want;
- (void)calculatePrice;
- (void)addList:(CartItemList *)list;
- (void)removeList:(CartItemList *)list;
- (BOOL)isAllSelected;
- (void)selectAllItems:(BOOL)select;
- (BOOL)empty;
- (void)removeAllItems;
- (void)clear;
@end
