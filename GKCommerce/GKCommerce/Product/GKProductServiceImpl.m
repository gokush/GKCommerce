//
//  GKProductServiceImpl.m
//  GKCommerce
//
//  Created by 小悟空 on 1/13/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKProductServiceImpl.h"
#import "GKProductBackendImpl.h"

@interface GKProductServiceImpl()

@property (strong, nonatomic) id<GKProductBackend> backend;
@end

@implementation GKProductServiceImpl
- (id)init
{
    self = [super init];
    if (self) {
        self.backend = [[Dependency shared] productBackend];
    }
    return self;
}

- (RACSignal *)productWithID:(NSInteger)productID user:(User *)anUser
{
    return [self.backend requestProductWithID:productID user:anUser];
}

- (RACSignal *)productCategories
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    return [RACDisposable disposableWithBlock:^{
    }];
  }];
}
@end
