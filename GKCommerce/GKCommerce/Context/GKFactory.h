//
//  GKFactory.h
//  GKCommerce
//
//  Created by 小悟空 on 11/26/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserBackend.h"
#import "UserRepository.h"
#import "UserService.h"
#import "CartBackend.h"
#import "CartRepository.h"
#import "CartService.h"
#import "ProductService.h"
#import "ProductBackend.h"
#import "FeatureService.h"
#import "FeatureBackend.h"
#import "AddressBackend.h"
#import "AddressService.h"
#import "GKProductService.h"
#import "GKProductBackendImpl.h"

@protocol GKFactory <NSObject>

- (id<CartBackend>)cartBackend;
- (id<CartService>)cartService;
- (id<GKProductBackend>)productBackend;
- (id<GKProductService>)productService;
- (id<UserBackend>)userBackend;
- (id<UserService>)userService;
- (id<FeatureService>)featureService;
- (id<FeatureBackend>)featureBackend;
- (id<AddressBackend>)addressBackend;
- (id<AddressService>)addressService;
@end
