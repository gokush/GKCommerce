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
@end
