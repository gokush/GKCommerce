//
//  ECUserBackend.m
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECUserBackend.h"

@implementation ECUserBackend

- (id)init
{
    self = [super init];
    if (self) {
        self.assembler = [[ECUserBackendAssembler alloc] init];
        self.manager = [AFHTTPRequestOperationManager manager];
        self.manager.responseSerializer.acceptableContentTypes =
            [NSSet setWithObject:@"text/html"];
    }
    return self;
}

- (void)requestAuthenticate:(UserAuthenticationModel *)user
{
    NSDictionary *parameters = @{ @"name": user.username,
                                  @"password": user.password };
    [self.manager
     POST:[NSString stringWithFormat:@"%@/user/signin", self.host]
     parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestAuthenticate:user didReceiveResponse:responseObject];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
     }];
}

- (void)requestAuthenticate:(UserAuthenticationModel *)user
         didReceiveResponse:(id)responseObject
{
    NSError *error;
    User *anUser;
    error = [self.assembler error:responseObject];
    if (!error)
        anUser = [self.assembler user:responseObject];
    
    SEL selector = @selector(userBackend:didCompleteAuthenticate:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate userBackend:self didCompleteAuthenticate:anUser
                             error:error];
}
@end
