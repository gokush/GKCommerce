//
//  CartViewModel.m
//  GKCommerce
//
//  Created by 小悟空 on 12/9/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "CartViewModel.h"

@implementation CartViewModel

- (id)initWithCart:(Cart *)cart
{
    self = [self init];
    if (self) {
        self.cart = cart;
        self.list = [[NSMutableArray alloc] init];
        for (int i = 0, size = cart.itemsOfStore.count; i < size; i++)
            [self.list addObject:[[CartItemListViewModel alloc] init]];
        
        @weakify(self)
        [RACObserve(cart, itemsOfStore)
         subscribeNext:^(NSMutableArray *itemsOfStore) {
             @strongify(self)
             for (int i = self.list.count, size = itemsOfStore.count; i < size;
                  i++)
                 [self.list addObject:[[CartItemListViewModel alloc] init]];
        }];
    }
    return self;
}
@end
