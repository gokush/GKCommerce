//
//  ECProductBackend.m
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECProductBackend.h"

@implementation ECProductBackend

- (id)init
{
    self = [super init];
    if (self) {
        self.assembler = [[ECProductBackendAssembler alloc] init];
    }
    return self;
}

- (void)requestProductWithID:(NSInteger)productID user:(User *)anUser
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:[NSString stringWithFormat:@"%d", productID]
                   forKey:@"goods_id"];
    
    if (anUser) {
        [parameters setObject:[NSString stringWithFormat:@"%d",
                               anUser.userID] forKey:@"session[uid]"];
        [parameters setObject:anUser.sessionID forKey:@"session[sid"];
    }
    [self.manager
     POST:[NSString stringWithFormat:@"%@/goods", self.config.backendURL]
     parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestProductWithID:productID user:anUser
                 didReceiveResponse:responseObject error:nil];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self requestProductWithID:productID user:anUser
                 didReceiveResponse:nil error:error];
     }];
}

- (void)requestProductWithID:(NSInteger)productID user:(User *)anUser
          didReceiveResponse:(id)responseObject error:(NSError *)anError
{
    NSError *error;
    Product *product;
    
    if (nil == anError) {
        error = [self.assembler error:responseObject];
    }
    
    product = [self.assembler product:[responseObject objectForKey:@"data"]];
    static SEL selector;
    selector = @selector(productBackend:didReceiveProduct:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate productBackend:(id<ProductBackend>)self
                    didReceiveProduct:product error:error];
}

@end
