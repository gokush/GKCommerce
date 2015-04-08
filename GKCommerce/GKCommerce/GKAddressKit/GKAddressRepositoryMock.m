//
//  GKAddressRepositoryMock.m
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/23/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import "GKAddressRepositoryMock.h"

@implementation GKAddressRepositoryMock

- (id)init
{
  self = [super init];
  if (self) {
    self.createWillSuccess = YES;
  }
  return self;
}

- (RACSignal *)findAddressesWithUser:(GKUser *)user
{
  return nil;
}

- (RACSignal *)create:(GKAddress *)address
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    [subscriber sendNext:address];
    [subscriber sendCompleted];
    
    return (RACDisposable *)nil;
  }];
}

- (RACSignal *)update:(GKAddress *)address
{
  return nil;
}

- (RACSignal *)addQueue:(GKAddress *)address queue:(GKAddressQueue)aQueue
{
  return nil;
}

- (RACSignal *)removeQueue:(GKAddress *)address queue:(GKAddressQueue)aQueue
{
  return nil;
}

- (RACSignal *)queues
{
  return nil;
}
@end
