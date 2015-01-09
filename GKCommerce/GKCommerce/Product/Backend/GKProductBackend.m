//
//  GKProductBackend.m
//  GKCommerce
//
//  Created by 小悟空 on 1/9/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKProductBackend.h"
#import <AFNetworking/AFNetworking.h>

@implementation GKProductBackend

- (id)init
{
    self = [super init];
    if (self) {
        self.assembler = [[GKProductBackendAssembler alloc] init];
    }
    return self;
}

- (RACSignal *)productWithID:(NSInteger)productID user:(User *)anUser
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:[NSString stringWithFormat:@"%d", (int)anUser.userID]
                   forKey:@"user_id"];
    @weakify(self)
    return
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self)
        [self.manager
         GET:[NSString stringWithFormat:@"%@/product/%d",
              self.config.backendURL, (int)productID]
         parameters:nil
         success:^(AFHTTPRequestOperation *operation,
                   id responseObject) {
             [subscriber sendNext:
              [self.assembler product:responseObject]];
         } failure:^(AFHTTPRequestOperation *operation,
                     NSError *error) {
             [subscriber sendError:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}
@end
