//
//  GKUserServiceImpl.h
//  GKCommerce
//
//  Created by 小悟空 on 1/16/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "UserAuthenticationModel.h"
#import "GKUserBackend.h"

@interface GKUserServiceImpl : NSObject <GKUserService>

@property (strong, nonatomic) id<GKUserBackend> backend;
@property (strong, nonatomic) UserRepository *repository;
- (User *)restore;
- (RACSignal *)authenticate:(UserAuthenticationModel *)model;
+ (instancetype)shared;
@end
