//
//  Cart.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "Cart.h"

@interface Cart ()
{
    BOOL isBatchOperation;
}
//@property (strong, nonatomic) NSMutableArray itemsOfStore;
@end

@implementation Cart

- (id)init
{
    NSLog(@"请使用initWithUser构造对象。");
    strcpy(0, "exception");
    
    self = [super init];
    if (self) {
        self.itemsOfStore = [NSMutableArray array];
        self.selected = [[NSMutableArray alloc] init];
        isBatchOperation = NO;
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
        isBatchOperation = NO;
    }
    return self;
}

- (void)addList:(CartItemList *)list
{
    [self.itemsOfStore addObject:list];
    @weakify(self);
    [RACObserve(list, selected) subscribeNext:^(NSMutableArray *listSelected) {
        @strongify(self);
        NSUInteger index = [self.selected indexOfObject:list];
        if ([list isAllSelected] && NSNotFound == index) {
            [self.selected addObject:list];
        } else if (![list isAllSelected]) {
            [self.selected removeObject:list];
        }
        if (!isBatchOperation) {
            [self willChangeValueForKey:@"selected"];
            [self didChangeValueForKey:@"selected"];
        }
    }];
    
    [RACObserve(list, price) subscribeNext:^(id x) {
        self.price = [[NSDecimalNumber alloc]
                      initWithFloat:[self wantTotalPrice]];
    }];
}

- (void)removeList:(CartItemList *)list
{
    [self.itemsOfStore removeObject:list];
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
        price += cartItem.product.listingPrice.floatValue * cartItem.quantity;
    }
    if (self.price.floatValue != price)
        self.price = [[NSDecimalNumber alloc] initWithFloat:price];
}

- (BOOL)empty
{
    NSInteger count = 0;
    for (CartItemList *list in self.itemsOfStore)
        count += list.items.count;
    
    if (count == 0)
        return YES;
    else
        return NO;
}

- (void)clear
{
    self.price = [[NSDecimalNumber alloc] initWithString:@"0.00"];
    self.itemsOfStore = nil;
}

- (BOOL)isAllSelected
{
    return self.selected.count == self.itemsOfStore.count;
}

- (void)selectAllItems:(BOOL)select
{
    isBatchOperation = YES;
    for (CartItemList *list in self.itemsOfStore)
        [list selectAllItems:select];
    isBatchOperation = NO;
    [self willChangeValueForKey:@"selected"];
    [self didChangeValueForKey:@"selected"];
}

- (void)removeAllItems
{
    [self willChangeValueForKey:@"itemsOfStore"];
    [self.itemsOfStore removeAllObjects];
    [self didChangeValueForKey:@"itemsOfStore"];
}

- (float)wantTotalPrice
{
    float total = 0;
    for (CartItemList *list in self.itemsOfStore)
        total += [list wantTotalPrice];
    
    return total;
}
@end
