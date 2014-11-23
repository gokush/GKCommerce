//
//  CartBackendDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 11/23/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Cart;
@protocol CartBackend;
@protocol CartBackendDelegate <NSObject>

- (void)cartBackend:(id<CartBackend>)aCartBackend didAddItem:(CartItem *)item
              error:(NSError *)anError;
- (void)cartBackend:(id<CartBackend>)aCartBackend didReceiveCart:(Cart *)cart
              error:(NSError *)anError;

- (void)cartBackend:(id<CartBackend>)aCartBackend didUpdateItem:(CartItem *)item
        oldQuantity:(NSInteger)anOldQuantity error:(NSError *)anError;

- (void)cartBackend:(id<CartBackend>)aCartBackend didRemoveItem:(CartItem *)item
              error:(NSError *)anError;
@end
