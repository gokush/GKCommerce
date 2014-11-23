//
//  UserService.m
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "UserService.h"

@implementation UserService

- (id)init
{
    self = [super init];
    if (self) {
        self.backend = [ECUserBackend shared];
        self.backend.delegate = self;
        self.repository = [[UserRepository alloc] init];
    }
    return self;
}

- (User *)restore
{
    User *user = [self.repository restore];
    if (user) {
        [[App shared] setCurrentUser:user];
    }
    
    DDLogVerbose(@"从磁盘用户恢复 %@ %d %@", user.username, user.userID,
                 user.sessionID);
    SEL selector = @selector(userService:didRestore:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate userService:self didRestore:user error:nil];
    
    return user;
}

- (void)authenticate:(UserAuthenticationModel *)model
{
    [self.backend requestAuthenticate:model];
}

- (void)userBackend:(UserBackend *)anUserBackend
didCompleteAuthenticate:(User *)anUser error:(NSError *)anError
{
    if (nil == anError) {
        [self.repository storage:anUser];
        [[App shared] setCurrentUser:anUser];
        DDLogVerbose(@"登录成功 %@", anUser.username);
    } else
        DDLogVerbose(@"登录失败 %@", anUser.username);
    
    SEL selector = @selector(userService:didAuthencate:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate userService:self didAuthencate:anUser error:anError];
}

+ (instancetype)shared
{
    static UserService *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}
@end
