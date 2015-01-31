//
//  GKFactoryImpl.h
//  GKCommerce
//
//  Created by 小悟空 on 1/13/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKFactory.h"

@interface GKFactoryImpl : NSObject <GKFactory>

- (id<GKCartBackend>)cartBackend;
- (id<GKCartService>)cartService;
- (id<GKProductBackend>)productBackend;
- (id<GKProductService>)productService;
- (id<GKUserBackend>)userBackend;
- (id<GKUserService>)userService;
- (id<FeatureService>)featureService;
- (id<FeatureBackend>)featureBackend;
- (id<AddressBackend>)addressBackend;
- (id<AddressService>)addressService;
@end
