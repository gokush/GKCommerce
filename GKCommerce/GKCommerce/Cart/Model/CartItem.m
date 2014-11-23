//
//  CartItem.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CartItem.h"
#import "Cart.h"

@implementation CartItem

- (id)init
{
    self = [super init];
    if (self) {
        self.selected = YES;
    }
    return self;
}

- (id)initWithCart:(Cart *)cart
{
    self = [self init];
    if (self) {
        self.cart = cart;
    }
    return self;
}

- (void)buy
{
    self.quantity += 1;
    
    [self updatePrice];
}

- (void)drop
{
    self.quantity -= 1;
    [self updatePrice];
}

- (void)updatePrice
{
    float totalPrice = self.quantity * [self.product.price floatValue];
    self.totalPrice = [[NSDecimalNumber alloc]initWithFloat:totalPrice];
}

- (void)setQuantity:(NSInteger)quantity
{
    if (_quantity != quantity) {
        _quantity = quantity;
        
        [self updatePrice];
        if (self.cart)
            [self.cart calculatePrice];
    }
}

- (void)clear
{
    self.quantity = 0;
}

- (void)setSelected:(BOOL)selected
{
    if (_selected != selected) {
        _selected = selected;
        
        [self.cart willChangeValueForKey:@"selected"];
        
        BOOL changed = NO;
        if (self.cart && selected &&
            [self.cart.selected indexOfObject:self] == NSNotFound) {
            [self.cart.selected addObject:self];
            changed = YES;
        } else if (self.cart && !selected) {
            [self.cart.selected removeObject:self];
            changed = YES;
        }
        
        if (changed)
            [self.cart calculatePrice];
        
        [self.cart didChangeValueForKey:@"selected"];
    }
}

- (CartItem *)clone;
{
    CartItem *cloned = [[CartItem alloc] init];
    cloned.itemID = self.itemID;
    cloned.product = self.product;
    cloned.quantity = self.quantity;
    cloned.price = self.price;
    cloned.totalPrice = self.totalPrice;
    cloned.cart = self.cart;
    cloned.selected = self.selected;
    
    return cloned;
}

+ (instancetype)itemWithCart:(Cart *)cart product:(Product *)aProduct
                    quantity:(NSInteger)aQuantity
{
    CartItem *item = [[CartItem alloc] init];
    item.cart = cart;
    item.product = aProduct;
    item.quantity = aQuantity;
    
    return item;
}
@end
