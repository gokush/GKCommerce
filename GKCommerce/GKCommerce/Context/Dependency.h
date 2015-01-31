//
//  Injection.h
//  GKCommerce
//
//  Created by 小悟空 on 11/25/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKFactory.h"

@interface Dependency : NSObject <GKFactory>

@property (strong, nonatomic) id<GKFactory> factory;
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
+ (instancetype)shared;
@end
