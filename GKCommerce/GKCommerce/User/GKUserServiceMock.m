//
//  GKUserServiceMock.m
//  GKCommerce
//
//  Created by 小悟空 on 1/30/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserServiceMock.h"
#import "GKUserBackendMock.h"

@implementation GKUserServiceMock

- (id)init
{
  self = [super init];
  if (self) {
    self.backend = [[GKUserBackendMock alloc] init];
    self.repository = [[UserRepository alloc] init];
  }
  return self;
}

@end
