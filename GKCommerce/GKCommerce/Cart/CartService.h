//
//  CartService.h
//  GKCommerce
//
//  Created by 小悟空 on 11/25/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartServiceDelegate.h"
#import "CartBackend.h"

@protocol CartService <NSObject, CartBackendDelegate>

@property (strong, nonatomic) Cart *cart;
@property (strong, nonatomic) id<CartServiceDelegate> delegate;
@property (strong, nonatomic) id<CartBackend> backend;

- (void)fetchCart;
- (void)addItem:(CartItem *)item;
- (void)updateItem:(CartItem *)item oldQuantity:(NSInteger)anOldQuantity;
- (void)removeItem:(CartItem *)item;
- (void)removeItems:(NSArray *)items;
@end
