//
//  CartService.m
//  GKCommerce
//
//  Created by 小悟空 on 11/23/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "CartService.h"
#import "ECCartBackend.h"

@implementation CartService

- (id)initWithCart:(Cart *)aCart
{
    self = [self init];
    if (self) {
        self.cart = aCart;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.backend = [[ECCartBackend alloc] init];
        self.backend.delegate = self;
    }
    return self;
}

- (void)items
{
    
}

- (void)addItem:(CartItem *)item
{
    [self.backend requestAddItem:item];
}

- (void)updateItem:(CartItem *)item oldQuantity:(NSInteger)anOldQuantity
{
    [self.backend requestUpdateItem:item oldQuantity:anOldQuantity];
}

- (void)removeItem:(CartItem *)item
{
    
}

- (void)removeItems:(NSArray *)items
{
    
}

#pragma mark - CartBackendDelegate

- (void)cartBackend:(id<CartBackend>)aCartBackend didAddItem:(CartItem *)item
              error:(NSError *)anError
{
    
}

- (void)cartBackend:(id<CartBackend>)aCartBackend didReceiveCart:(Cart *)cart
              error:(NSError *)anError
{
    SEL selector = @selector(cartService:cart:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate cartService:self cart:cart error:anError];
}

- (void)cartBackend:(id<CartBackend>)aCartBackend didUpdateItem:(CartItem *)item
        oldQuantity:(NSInteger)anOldQuantity error:(NSError *)anError
{
    
}

- (void)cartBackend:(id<CartBackend>)aCartBackend didRemoveItem:(CartItem *)item
              error:(NSError *)anError
{
    
}
@end
