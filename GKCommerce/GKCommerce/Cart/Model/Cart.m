//
//  Cart.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "Cart.h"

@implementation Cart

- (id)init
{
    NSLog(@"请使用initWithUser构造对象。");
    strcpy(0, "exception");
    
    self = [super init];
    if (self) {
        self.itemsOfStore = [NSMutableArray array];
        
    }
    
    return self;
}

- (id)initWithUser:(User *)user
{
    self = [super init];
    if (self) {
        self.itemsOfStore = [NSMutableArray array];
        self.selected = [[NSMutableArray alloc] init];
        self.user = user;
    }
    return self;
}

- (CartItem *)itemWithProductID:(NSInteger)productID
{
    __block CartItem *found = nil;
    [self.itemsOfStore enumerateObjectsUsingBlock:^(id obj, NSUInteger idx,
                                                BOOL *stop) {
        CartItem *item = (CartItem *)obj;
        if (item.product.productID == productID)
            found = item;
    }];
    
    return found;
}

- (NSArray *)want
{
    NSMutableArray *wantBuy = [NSMutableArray array];
    for (CartItem *cartItem in self.itemsOfStore) {
        if(cartItem.selected) {
            [wantBuy addObject:cartItem];
        }
    }
    
    return wantBuy;
}

- (void)calculatePrice
{
    float price = 0.0f;
    for (CartItem *cartItem in self.selected) {
        price += cartItem.product.price.floatValue * cartItem.quantity;
    }
    if (self.price.floatValue != price)
        self.price = [[NSDecimalNumber alloc] initWithFloat:price];
}

- (BOOL)empty
{
    if (nil == self.itemsOfStore || self.itemsOfStore.count == 0)
        return YES;
    else
        return NO;
}

- (void)clear
{
    self.price = [[NSDecimalNumber alloc] initWithString:@"0.00"];
    self.itemsOfStore = nil;
}

- (void)setSelectAll:(BOOL)selected
{
    for (CartItem *item in self.itemsOfStore)
        item.selected = selected;
}

- (BOOL)selectAll
{
    for (CartItem *item in self.itemsOfStore)
        if (!item.selected)
            return NO;
    
    return YES;
}

@end
