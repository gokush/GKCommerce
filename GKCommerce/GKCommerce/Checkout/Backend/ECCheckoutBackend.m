//
//  ECCheckoutBackend.m
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECCheckoutBackend.h"

@implementation ECCheckoutBackend

- (id)init
{
    self = [super init];
    if (self) {
        self.assembler = [[ECCheckoutAssembler alloc] init];
    }
    return self;
}

- (void)requestCheckout:(Cart *)cart
{
    
}

- (void)requestValidateCheckout:(Cart *)cart
{
    NSString *userID;
    NSDictionary *parameters;
    
    User *user = cart.user;
    userID = [NSString stringWithFormat:@"%d", user.userID];
    parameters = @{ @"session[uid]": userID,
                    @"session[sid]": user.sessionID };
    [self.manager
     POST:[NSString stringWithFormat:@"%@/flow/checkOrder",
           self.config.backendURL]
     parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestValidateCheckout:cart didReceiveResponse:responseObject
                                 error:nil];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self requestValidateCheckout:cart didReceiveResponse:nil error:error];
     }];
}

- (void)requestValidateCheckout:(Cart *)cart
             didReceiveResponse:(id)responseObject error:(NSError *)anError
{
    NSError *error;
    if (anError)
        error = anError;
    else
        error = [self.assembler error:responseObject];
    
    NSMutableDictionary *result;
    NSArray *shippingsJSON;
    NSArray *paymentsJSON;
    NSArray *invoicesJSON;
    id data = [responseObject objectForKey:@"data"];
    
    result = [[NSMutableDictionary alloc] init];
    shippingsJSON = [data objectForKey:@"shipping_list"];
    paymentsJSON = [data objectForKey:@"payment_list"];
    invoicesJSON = [data objectForKey:@"inv_content_list"];
    
    if (shippingsJSON) {
        [result setObject:[self.assembler shippingsWithJSON:shippingsJSON]
                   forKey:@"shippings"];
    }
    
    if (paymentsJSON) {
        [result setObject:[self.assembler paymentsWithJSON:paymentsJSON]
                   forKey:@"payments"];
    }
    
    if (invoicesJSON) {
        [result setObject:[self.assembler invoiceWithJSON:invoicesJSON]
                   forKey:@"invoice"];
    }
    
    SEL selector = @selector(ecCheckoutBackend:didReceiveResult:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate ecCheckoutBackend:self didReceiveResult:result];
}
@end
