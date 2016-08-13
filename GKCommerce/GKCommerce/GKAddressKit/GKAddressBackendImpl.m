//
//  GKAddressBackendImpl.m
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/21/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import "GKAddressBackendImpl.h"

@implementation GKAddressBackendImpl

- (RACSignal *)fetchAddressesWithToken:(NSString *)token;
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      GKAddress *address = [GKAddress new];
      address.name = @"小悟空";
      address.cellPhone = @"1300000000";
      address.address = @"上海市静安区愚园东路";
      address.isDefault = YES;
      
      [subscriber sendNext:address];
      [subscriber sendCompleted];
    
    return [RACDisposable disposableWithBlock:^{
    }];
  }];
}
@end
