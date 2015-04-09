//
//  GKUserBackendMock.m
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "GKUserBackendMock.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "GKUserAccessToken.h"
#import "GKUser.h"
#import "GKUserRepository.h"

@implementation GKUserBackendMock

- (RACSignal *)signup:(GKUserRegistration *)user
{
    return
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        GKUser *user=[[GKUser alloc] init];
        user.userID=111;
        user.username=@"GG";
        user.email=@"knight731@hotmail.com";
        GKUserQueue queue=GKUserQueueCreate;
        [subscriber sendNext:RACTuplePack(user,[NSNumber numberWithInteger:queue])];
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
}
- (RACSignal *)forgotPassword:(GKUserForgotPassword *) forgotPassword
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:forgotPassword];
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
}

- (RACSignal *)authencate:(GKUserAuthentication *)authentication
{
    return
    [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        BOOL authenticated;
        authenticated = [authentication.username isEqualToString:@"error"] &&
                        [authentication.password isEqualToString:@"error"];
        if (YES == authenticated) {
            NSError *error;
            error = [NSError
                     errorWithDomain:@"UserBackend" code:1
                     userInfo:@{NSLocalizedDescriptionKey:@"错误的账号名或者密码"}];
            [subscriber sendError:error];
        } else {
            [subscriber sendNext:[[GKUser alloc] init]];
            [subscriber sendCompleted];
            
        }
        return [RACDisposable disposableWithBlock:^{
        }];
    }] delay:2];
}
@end
