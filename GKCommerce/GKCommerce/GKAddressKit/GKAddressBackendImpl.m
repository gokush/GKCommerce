//
//  GKAddressBackendImpl.m
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/21/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import "GKAddressBackendImpl.h"

@implementation GKAddressBackendImpl

- (RACSignal *)fetchAddresses
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    
    
    return [RACDisposable disposableWithBlock:^{
    }];
  }];
}
@end
