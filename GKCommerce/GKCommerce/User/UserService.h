//
//  UserService.h
//  GKCommerce
//
//  Created by 小悟空 on 11/27/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "UserAuthenticationModel.h"
#import "UserServiceDelegate.h"
#import "UserBackend.h"

@protocol UserService <NSObject>

@property (strong, nonatomic) id<UserBackend> backend;
@property (strong, nonatomic) id<UserServiceDelegate> delegate;
- (User *)restore;
- (void)authenticate:(UserAuthenticationModel *)model;
@end
