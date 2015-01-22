//
//  GKProductServiceMock.m
//  GKCommerce
//
//  Created by 小悟空 on 1/22/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKProductServiceMock.h"
#import "GKProductBackendAssembler.h"

@implementation GKProductServiceMock {
  GKProductBackendAssembler *assembler;
}

- (id)init
{
  self = [super init];
  if (self) {
    assembler = [[GKProductBackendAssembler alloc] init];
  }
  return self;
}

- (RACSignal *)productWithID:(NSInteger)productID user:(User *)anUser
{
  return nil;
}

- (RACSignal *)productCategories
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    NSArray *productCategories = (NSArray *)
      [self loadJSON:@"ProductCategories"];
    [subscriber sendNext:[assembler productCategories:productCategories]];
    return [RACDisposable disposableWithBlock:^{
    }];
  }];
}
@end
