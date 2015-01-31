//
//  GKFactoryMock.m
//  GKCommerce
//
//  Created by 小悟空 on 1/22/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKFactoryMock.h"
#import "GKCartBackendImpl.h"
#import "GKCartServiceMock.h"
#import "GKUserBackendMock.h"
#import "GKUserServiceMock.h"
#import "ECProductBackend.h"
#import "ECProductService.h"
#import "GKFeatureBackend.h"
#import "GKFeatureService.h"

#import "GKProductServiceMock.h"

@implementation GKFactoryMock

- (id<GKCartBackend>)cartBackend
{
  return [[GKCartBackendImpl alloc] init];
}

- (id<GKCartService>)cartService
{
  return [[GKCartServiceMock alloc] init];
}

- (id<GKUserBackend>)userBackend
{
  return [[GKUserBackendMock alloc] init];
}

- (id<GKUserService>)userService
{
  return [[GKUserServiceMock alloc] init];
}

- (id<GKProductBackend>)productBackend
{
  return nil;
}

- (id<GKProductService>)productService
{
  return [[GKProductServiceMock alloc] init];
}

- (id<FeatureService>)featureService
{
  return [[GKFeatureService alloc] init];
}

- (id<FeatureBackend>)featureBackend
{
  return [[GKFeatureBackend alloc] init];
}

- (id<AddressBackend>)addressBackend
{
  return nil;
}

- (id<AddressService>)addressService
{
  return nil;
}

@end
