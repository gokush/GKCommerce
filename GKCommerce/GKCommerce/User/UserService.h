//
//  UserService.h
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserServiceDelegate.h"
#import "App.h"
#import "ECUserBackend.h"
#import "UserRepository.h"

@interface UserService : NSObject <UserBackendDelegate>

@property (strong, nonatomic) UserBackend *backend;
@property (strong, nonatomic) UserRepository *repository;
@property (strong, nonatomic) id<UserServiceDelegate> delegate;
- (User *)restore;
- (void)authenticate:(UserAuthenticationModel *)model;
+ (instancetype)shared;
@end
