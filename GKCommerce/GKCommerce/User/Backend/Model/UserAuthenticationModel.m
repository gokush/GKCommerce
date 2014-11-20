//
//  UserAuthenticationModel.m
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "UserAuthenticationModel.h"

@implementation UserAuthenticationModel

- (id)initWithUsername:(NSString *)username password:(NSString *)aPassword
{
    self = [self init];
    if (self) {
        self.username = username;
        self.password = aPassword;
    }
    return self;
}
@end
