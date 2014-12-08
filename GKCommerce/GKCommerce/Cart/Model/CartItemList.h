//
//  CartItemCollection.h
//  GKCommerce
//
//  Created by 小悟空 on 12/2/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Store;
@class Cart;
@interface CartItemList : NSObject

@property (weak, nonatomic) Store *store;
@property (weak, nonatomic) Cart *cart;
@property (strong, nonatomic) NSMutableArray *selected;
@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) NSDecimalNumber *price;

- (CartItem *)itemAtIndex:(NSInteger)index;
- (void)addItem:(CartItem *)item;
- (void)addItems:(NSArray *)items;
- (void)removeItem:(CartItem *)item;
- (void)removeItemWithID:(NSInteger)itemID;
- (BOOL)isAllSelected;
- (void)selectAllItems:(BOOL)select;
@end
