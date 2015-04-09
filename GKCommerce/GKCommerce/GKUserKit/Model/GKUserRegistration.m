//
//  GKUserRegistration.m
//  GKUserKitExample
//
//  Created by 小悟空 on 2/23/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserRegistration.h"

#define INVALID_USERNAME @"请输入正确的用户名"
#define INVALID_PASSWORD @"请输入正确的密码"
#define INVALID_EMAIL    @"请输入正确的邮箱"
#define EMAIL_REGEX @"^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$"

@implementation GKUserRegistration

- (id)initRegistrationWithUsername:(NSString *)username passWord:(NSString *)password email:(NSString *)email {
    self = [self init];
    if (self) {
        self.username = username;
        self.password = password;
        self.email    = email;
    }
    
    return self;
}

- (NSError *)valid
{
    BOOL hasError = NO;
    NSInteger errorCode = -1;
    NSDictionary *errorDescription;
    NSError *error;
    if (!(self.email && self.email.length > 0 && [self isValidEmail:self.email])) {
        errorCode = 1;
        errorDescription = @{ NSLocalizedDescriptionKey: INVALID_EMAIL };
        hasError = YES;
    } else if (!(self.username && self.username.length > 0)) {
        errorCode = 3;
        errorDescription = @{ NSLocalizedDescriptionKey: INVALID_USERNAME };
        hasError = YES;
    } else if (!(self.password && self.password.length > 0)) {
        errorCode = 2;
        errorDescription = @{ NSLocalizedDescriptionKey: INVALID_PASSWORD };
        hasError = YES;
    }
    
    if (hasError)
        error = [NSError errorWithDomain:@"UserRegistration"
                                    code:errorCode
                                userInfo:errorDescription];
    return error;
}


- (BOOL)isValidEmail:(NSString *)emailText {
    return [self matchRegex:EMAIL_REGEX string:emailText];
}


- (BOOL)matchRegex:(NSString*)regexStr string:(NSString*)str
{
    NSError *err = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&err];
    NSUInteger numOfMatch = [regex numberOfMatchesInString:str
                                                   options:NSMatchingAnchored
                                                     range:NSMakeRange(0, [str length])];
    return (numOfMatch>0);
}

@end
