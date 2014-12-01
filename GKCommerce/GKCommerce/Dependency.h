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
- (id<CartBackend>)cartBackend;
- (id<CartService>)cartService;
- (id<ProductBackend>)productBackend;
- (id<ProductService>)productService;
- (id<UserBackend>)userBackend;
- (id<UserService>)userService;
- (id<FeatureService>)featureService;
- (id<FeatureBackend>)featureBackend;
+ (instancetype)shared;
@end
