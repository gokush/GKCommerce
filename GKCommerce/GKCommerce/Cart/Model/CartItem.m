//
//  CartItem.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CartItem.h"
#import "Cart.h"
#import "CartItemList.h"

@implementation CartItem

- (id)init
{
    self = [super init];
    if (self) {
        self.selected = YES;
    }
    return self;
}

- (id)initWithList:(CartItemList *)list
{
    self = [self init];
    if (self) {
        self.list = list;
    }
    return self;
}

- (void)dealloc
{
    
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

- (void)removeFromList
{
    [self.list removeItem:self];
}

- (CartItem *)clone;
{
    CartItem *cloned = [[CartItem alloc] init];
    cloned.itemID = self.itemID;
    cloned.product = self.product;
    cloned.quantity = self.quantity;
    cloned.price = self.price;
    cloned.totalPrice = self.totalPrice;
    cloned.list = self.list;
    cloned.selected = self.selected;
    
    return cloned;
}

+ (instancetype)itemWithCart:(Cart *)cart product:(Product *)aProduct
                    quantity:(NSInteger)aQuantity
{
    CartItem *item = [[CartItem alloc] init];
//    item.list = list;
    item.product = aProduct;
    item.quantity = aQuantity;
    
    return item;
}
@end
