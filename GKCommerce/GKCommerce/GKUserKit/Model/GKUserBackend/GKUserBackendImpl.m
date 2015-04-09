//
//  GKUserBackendImpl.m
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "GKUserBackendImpl.h"
#import "GKUserAccessToken.h"

@implementation GKUserBackendImpl

- (id)init {
    
    self = [super init];
    if (self) {
        self.manager = [AFHTTPRequestOperationManager manager];
    }
    return self;
}

- (RACSignal *)signup:(GKUserRegistration *)user {
    @weakify(self)
    NSDictionary *params = @{@"email":user.email, @"passWord":user.password, @"username":user.username};
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self)
        [self.manager POST:@"URL_TO_FILL" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            GKUserAccessToken *accessToken = [[GKUserAccessToken alloc] init];
            accessToken.accessToken = responseObject[@"accessToken"];
            
            [subscriber sendNext:accessToken];
            [subscriber sendCompleted];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [subscriber sendError:error];
            [subscriber sendCompleted];
            
            [self signup:nil];
        }];
        return [RACDisposable disposableWithBlock:^{
        }];
        
    }];
}



















































@end
