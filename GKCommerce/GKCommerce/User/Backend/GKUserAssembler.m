//
//  GKUserAssembler.m
//  GKCommerce
//
//  Created by 小悟空 on 1/15/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserAssembler.h"

@implementation GKUserAssembler

- (User *)user:(NSDictionary *)anUser;
{
    User *user = [[User alloc] init];
    user.email = [anUser objectForKey:@"email"];
    user.username = [anUser objectForKey:@"username"];
    user.userID = [[anUser objectForKey:@"id"] integerValue];
    return user;
}
@end
