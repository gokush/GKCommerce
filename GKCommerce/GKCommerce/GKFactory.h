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

@protocol GKFactory <NSObject>

- (id<CartBackend>)cartBackend;
- (id<CartService>)cartService;
@end
