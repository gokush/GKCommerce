//
//  CartItem.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@class Cart;
@interface CartItem : NSObject

@property (strong, nonatomic) Product *product;
@property (assign, nonatomic) NSInteger itemID;
@property (assign, nonatomic) NSInteger quantity;
@property (strong, nonatomic) NSDecimalNumber *price;
@property (strong, nonatomic) NSDecimalNumber *totalPrice;
@property (strong, nonatomic) Cart *cart;
@property (assign, nonatomic) BOOL selected;

- (id)initWithCart:(Cart *)cart;
- (void)buy;
- (void)drop;
- (void)clear;
- (CartItem *)clone;
- (void)updatePrice;

+ (instancetype)itemWithCart:(Cart *)cart product:(Product *)aProduct
                       quantity:(NSInteger)aQuantity;
@end
