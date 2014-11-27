//
//  UserServiceDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@protocol UserService;
@protocol UserServiceDelegate <NSObject>

@optional
- (void)userService:(id<UserService>)anUserService didAuthencate:(User *)user
              error:(NSError *)anError;
- (void)userService:(id<UserService>)anUserService didRestore:(User *)user
              error:(NSError *)anError;
@end
