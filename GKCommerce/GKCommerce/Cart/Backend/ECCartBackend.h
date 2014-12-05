//
//  ECCartBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 11/23/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "Backend.h"
#import "Cart.h"
#import "CartItemList.h"
#import "CartItem.h"
#import "CartBackend.h"
#import "CartBackendDelegate.h"
#import "ECCartBackendAssembler.h"

@interface ECCartBackend : Backend <CartBackend>

@property (strong, nonatomic) id<CartBackendDelegate> delegate;
@property (strong, nonatomic) ECCartBackendAssembler *assembler;
- (void)requestAddItem:(CartItem *)item;
- (void)requestCartWithUser:(User *)user;
- (void)requestUpdateItem:(CartItem *)item oldQuantity:(NSInteger)anOldQuantity;
- (void)requestRemoveItem:(CartItem *)item;
@end
