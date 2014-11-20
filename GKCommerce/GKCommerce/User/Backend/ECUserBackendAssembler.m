//
//  ECUserBackendAssembler.m
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECUserBackendAssembler.h"

@implementation ECUserBackendAssembler

- (User *)user:(NSDictionary *)JSON
{
    User *user = [[User alloc] init];
    user.userID = [[JSON valueForKeyPath:@"data.session.uid"] integerValue];
    user.sessionID = [JSON valueForKeyPath:@"data.session.sid"];
    
    user.username = [JSON valueForKeyPath:@"data.user.name"];
    user.email = [JSON valueForKeyPath:@"data.user.email"];
    
    return user;
}

- (NSError *)error:(NSDictionary *)JSON
{
    NSError *error;
    
    if ([[JSON valueForKeyPath:@"status.succeed"] integerValue] == 0) {
        NSInteger errorCode;
        NSDictionary *errorDescription;
        errorCode = [[JSON valueForKeyPath:@"status.error_code"] integerValue];
        errorDescription = @{
            NSLocalizedDescriptionKey:
                [JSON valueForKeyPath:@"status.error_desc"]
        };
        error = [NSError errorWithDomain:@"ECMobile" code:errorCode
                                userInfo:errorDescription];
    }
    
    return error;
}
@end
