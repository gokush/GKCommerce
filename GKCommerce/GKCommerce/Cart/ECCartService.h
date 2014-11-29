//
//  CartService.h
//  GKCommerce
//
//  Created by 小悟空 on 11/23/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartService.h"
#import "CartBackend.h"
#import "CartBackendDelegate.h"
#import "CartRepository.h"
#import "User.h"

@interface ECCartService : NSObject <CartService, CartBackendDelegate>

@property (strong, nonatomic) id<CartServiceDelegate> delegate;
@property (strong, nonatomic) id<CartBackend> backend;
@property (strong, nonatomic) CartRepository *repository;

- (void)fetch:(Cart *)cart;
- (void)addItem:(CartItem *)item;
- (void)updateItem:(CartItem *)item oldQuantity:(NSInteger)anOldQuantity;
- (void)removeItem:(CartItem *)item;
- (void)removeItems:(NSArray *)items;
@end
