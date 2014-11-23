//
//  UserRepository.m
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "UserRepository.h"

@implementation UserRepository

- (User *)restore
{
    User *user;
    NSData *raw = [[NSUserDefaults standardUserDefaults] objectForKey:@"user"];
    if (nil != raw)
        user = [NSKeyedUnarchiver unarchiveObjectWithData:raw];
    return user;
}

- (void)storage:(User *)user
{
    NSData *raw = [NSKeyedArchiver archivedDataWithRootObject:user];
    [[NSUserDefaults standardUserDefaults] setObject:raw forKey:@"user"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (instancetype)shared
{
    static UserRepository *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}
@end
