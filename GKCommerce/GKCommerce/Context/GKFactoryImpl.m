//
//  GKFactoryImpl.m
//  GKCommerce
//
//  Created by 小悟空 on 1/13/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKFactoryImpl.h"
#import "GKCartBackendImpl.h"
#import "GKCartServiceImpl.h"
#import "GKUserBackendImpl.h"
#import "GKUserServiceImpl.h"
#import "ECProductBackend.h"
#import "ECProductService.h"
#import "GKFeatureBackend.h"
#import "GKFeatureService.h"
#import "GKProductBackendImpl.h"
#import "GKProductServiceImpl.h"

@implementation GKFactoryImpl
- (id<GKCartBackend>)cartBackend
{
    return [[GKCartBackendImpl alloc] init];
}

- (id<GKCartService>)cartService
{
    return [[GKCartServiceImpl alloc] init];
}

- (id<GKUserBackend>)userBackend
{
    return [[GKUserBackendImpl alloc] init];
}

- (id<GKUserService>)userService
{
    return [[GKUserServiceImpl alloc] init];
}

- (id<GKProductBackend>)productBackend
{
    return [[GKProductBackendImpl alloc] init];
}

- (id<GKProductService>)productService
{
    return [[GKProductServiceImpl alloc] init];
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
