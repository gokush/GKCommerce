//
//  CartItem.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@class CartItemList;
@interface CartItem : NSObject

@property (weak, nonatomic) CartItemList *list;
@property (strong, nonatomic) Product *product;
@property (assign, nonatomic) NSInteger itemID;
@property (assign, nonatomic) NSInteger quantity;
@property (strong, nonatomic) NSDecimalNumber *price;
@property (strong, nonatomic) NSDecimalNumber *totalPrice;
@property (assign, nonatomic) BOOL selected;

- (id)initWithList:(CartItemList *)list;
- (void)removeFromList;
- (CartItem *)clone;
@end
