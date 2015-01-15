//
//  GKUserBackendImpl.m
//  GKCommerce
//
//  Created by 小悟空 on 1/15/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserBackendImpl.h"

@implementation GKUserBackendImpl

- (id)init
{
    self = [super init];
    if (self) {
        self.assembler = [[GKUserAssembler alloc] init];
    }
    return self;
}

- (RACSignal *)requestAuthenticate:(UserAuthenticationModel *)user
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    parameters[@"grant_type"]       = @"password";
    parameters[@"username"]         = user.username;
    parameters[@"password"]         = user.password;
    parameters[@"client_id"]        = @"swagger";
    parameters[@"client_secret"]    = @"swagger";
    
    @weakify(self)
    return
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self)
        [self.manager
         GET:[NSString stringWithFormat:@"%@/oauth/access_token",
              self.config.backendURL]
         parameters:nil
         success:^(AFHTTPRequestOperation *operation,
                   id responseObject) {
             [subscriber sendNext:
              [self.assembler user:responseObject]];
         } failure:^(AFHTTPRequestOperation *operation,
                     NSError *error) {
             [subscriber sendError:error];
         }];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

- (RACSignal *)requestUser:(User *)user
{
}
@end
