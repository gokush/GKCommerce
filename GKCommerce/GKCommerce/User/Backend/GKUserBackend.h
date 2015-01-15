//
//  GKUserBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 1/15/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "UserAuthenticationModel.h"

@protocol GKUserBackend <NSObject>

- (RACSignal *)requestAuthenticate:(UserAuthenticationModel *)user;
- (RACSignal *)requestUser:(User *)user;
@end
