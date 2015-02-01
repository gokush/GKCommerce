//
//  GKCartServiceMock.m
//  GKCommerce
//
//  Created by 小悟空 on 1/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKCartServiceMock.h"

@implementation GKCartServiceMock
- (RACSignal *)fetchCartWithUser:(User *)user
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    return [RACDisposable disposableWithBlock:^{}];
  }];
}

- (RACSignal *)addItem:(CartItem *)item
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    [item.list addItem:item];
    
    [subscriber sendNext:item];
    [subscriber sendCompleted];
    return [RACDisposable disposableWithBlock:^{}];
  }];
}

- (RACSignal *)addItemWithProduct:(Product *)product cart:(Cart *)aCart
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    CartItemList *list = [aCart cartItemListWithStore:product.store];
    list.cart = aCart;
    CartItem *item = [[CartItem alloc] initWithList:list];
    item.product = product;
    item.quantity = 1;
    [list addItem:item];
    
    [subscriber sendNext:item];
    [subscriber sendCompleted];
    return [RACDisposable disposableWithBlock:^{}];
  }];
}

- (RACSignal *)updateItem:(CartItem *)item oldQuantity:(NSInteger)anOldQuantity
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    return [RACDisposable disposableWithBlock:^{}];
  }];
}

- (RACSignal *)removeItem:(CartItem *)item
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    return [RACDisposable disposableWithBlock:^{}];
  }];
}

- (RACSignal *)removeItems:(NSArray *)items
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    return [RACDisposable disposableWithBlock:^{}];
  }];
}
@end
