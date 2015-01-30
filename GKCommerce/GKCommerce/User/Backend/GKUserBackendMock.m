//
//  GKUserBackendMock.m
//  GKCommerce
//
//  Created by 小悟空 on 1/30/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserBackendMock.h"

@implementation GKUserBackendMock

- (RACSignal *)requestAuthenticate:(UserAuthenticationModel *)user
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    GKUserAccessToken *accessToken = [[GKUserAccessToken alloc] init];
    accessToken.accessToken = @"accessToken";
    accessToken.type = GKBearer;
    accessToken.expires = 0;
    
    [subscriber sendNext:accessToken];
    [subscriber sendCompleted];
    return [RACDisposable disposableWithBlock:^{}];
  }];
}

- (RACSignal *)requestUser:(GKUserAccessToken *)accessToken
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    User *user = [[User alloc] init];
    user.userID = 1;
    user.username = @"Goku";
    user.accessToken = accessToken;
    user.avatar = [[GKResizer alloc] initWithString:@"user_avatar@2x.jpg"];
    
    [subscriber sendNext:user];
    [subscriber sendCompleted];
    return [RACDisposable disposableWithBlock:^{}];
  }];
}
@end
