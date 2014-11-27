//
//  CartServiceDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 11/23/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cart.h"

@protocol CartService;
@protocol CartServiceDelegate <NSObject>

@optional
- (void)cartService:(id<CartService>)aCartService cart:(Cart *)aCart
              error:(NSError *)anError;
- (void)cartService:(id<CartService>)aCartService didAddItem:(CartItem *)item
              error:(NSError *)anError;
- (void)cartService:(id<CartService>)aCartService didUpdateItem:(CartItem *)item
        oldQuantity:(NSInteger)anOldQuantity error:(NSError *)anError;
- (void)cartService:(id<CartService>)aCartService didRemoveItem:(CartItem *)item
        error:(NSError *)anError;
@end
