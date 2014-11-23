//
//  UserBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

//TODO: UserBackend 改成Protocol
#import <Foundation/Foundation.h>
#import "Backend.h"
#import "User.h"
#import "UserAuthenticationModel.h"
#import "UserBackendDelegate.h"

@interface UserBackend : Backend

@property (strong, nonatomic) id<UserBackendDelegate> delegate;
- (void)requestAuthenticate:(UserAuthenticationModel *)user;
+ (instancetype)shared;
@end
