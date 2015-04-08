//
//  GKAddressBackendMock.m
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/21/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import "GKAddressBackendMock.h"

@implementation GKAddressBackendMock

- (id)init
{
  self = [super init];
  return self;
}

- (RACSignal *)fetchAddresses
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    
    GKAddress *address = [[GKAddress alloc] init];
    address.name = @"小悟空";
    address.cellPhone = @"15202171763";
    address.postcode = @"900032";
    address.address = @"上海市浦东新区张杨北路 距离市中心约15500米";
    
    GKProvince *province = [[GKProvince alloc] init];
    province.name = @"上海市";
    
    GKCity *city = [[GKCity alloc] init];
    city.name = @"上海市";
    
    GKCounty *county = [[GKCounty alloc] init];
    county.name = @"虹口区";
    
    address.province = province;
    address.city = city;
    address.county = county;
    address.isDefault = YES;
    
    [subscriber sendNext:@[address]];
    [subscriber sendCompleted];
    
    return [RACDisposable disposableWithBlock:^{
    }];
  }];
}

- (RACSignal *)create:(GKAddress *)address
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    GKAddress *cloned = [address clone];
    cloned.addressID = 1;
    
    [subscriber sendNext:cloned];
    [subscriber sendCompleted];
    
    return (RACDisposable *)nil;
  }];
}
@end
