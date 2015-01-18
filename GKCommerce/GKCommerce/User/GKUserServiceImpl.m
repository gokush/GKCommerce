//
//  GKUserServiceImpl.m
//  GKCommerce
//
//  Created by 小悟空 on 1/16/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserServiceImpl.h"

@implementation GKUserServiceImpl

- (id)init
{
    self = [super init];
    if (self) {
        self.backend = [[Dependency shared] userBackend];
        self.repository = [[UserRepository alloc] init];
    }
    return self;
}

- (User *)restore
{
    User *user = [self.repository restore];
    if (user) {
        [[App shared] setCurrentUser:user];
        
        DDLogVerbose(@"从磁盘用户恢复 %@ %d %@", user.username, user.userID,
                     user.sessionID);
    }
    
    return user;
}

- (RACSignal *)authenticate:(UserAuthenticationModel *)model
{
    return
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[self.backend requestAuthenticate:model]
         subscribeNext:[self didAuthenticateUserSuccess:subscriber]
         error:[self didAuthenticateUserFailure:subscriber]];
        
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
}

- (void(^)(User *))didAuthenticateUserSuccess:(id<RACSubscriber>)subscriber
{
    return ^(User *user) {
        [self.repository storage:user];
        [[App shared] setCurrentUser:user];
        DDLogVerbose(@"登录成功 %@", user.username);
        [subscriber sendNext:user];
        [subscriber sendCompleted];
    };
}

- (void(^)(NSError *))didAuthenticateUserFailure:(id<RACSubscriber>)subscriber
{
    return ^(NSError *error) {
        DDLogVerbose(@"登录失败");
        [subscriber sendError:error];
    };
}

+ (instancetype)shared
{
    static GKUserServiceImpl *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}
@end
