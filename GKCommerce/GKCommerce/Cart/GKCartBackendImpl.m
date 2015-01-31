//
//  GKCartBackendImpl.m
//  GKCommerce
//
//  Created by 小悟空 on 1/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKCartBackendImpl.h"

@implementation GKCartBackendImpl

- (RACSignal *)requestCartWithUser:(User *)user
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    return [RACDisposable disposableWithBlock:^{}];
  }];
}

- (RACSignal *)requestAddItem:(CartItem *)item
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    return [RACDisposable disposableWithBlock:^{}];
  }];
}

- (RACSignal *)requestUpdateItem:(CartItem *)item
                     oldQuantity:(NSInteger)anOldQuantity
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    return [RACDisposable disposableWithBlock:^{}];
  }];
}

- (RACSignal *)requestRemoveItem:(CartItem *)item
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    return [RACDisposable disposableWithBlock:^{}];
  }];
}
@end
