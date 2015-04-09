//
//  UserAuthenticationModel.m
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "GKUserAuthentication.h"

#define INVALID_USERNAME @"请输入正确的用户名"
#define INVALID_PASSWORD @"请输入正确的密码"

@implementation GKUserAuthentication

- (id)initWithUsername:(NSString *)username password:(NSString *)aPassword
{
    self = [self init];
    if (self) {
        self.username = username;
        self.password = aPassword;
    }
    return self;
}

- (NSError *)valid
{
    BOOL hasError = NO;
    NSInteger errorCode = -1;
    NSDictionary *errorDescription;
    NSError *error;
    if (!(self.username && self.username.length > 0)) {
        errorCode = 1;
        errorDescription = @{ NSLocalizedDescriptionKey: INVALID_USERNAME };
        hasError = YES;
    } else if (!(self.password && self.password.length > 0)) {
        errorCode = 2;
        errorDescription = @{ NSLocalizedDescriptionKey: INVALID_PASSWORD };
        hasError = YES;
    }
    
    if (hasError)
         error = [NSError errorWithDomain:@"UserAuthentication"
                                     code:errorCode
                                 userInfo:errorDescription];
    return error;
}
@end
