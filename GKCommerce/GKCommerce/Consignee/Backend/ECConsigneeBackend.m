//
//  ECConsigneeBackend.m
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECConsigneeBackend.h"

@implementation ECConsigneeBackend

- (void)requestConsigneesWithUser:(User *)user
{
    NSString *userID;
    NSDictionary *parameters;
    
    userID = [NSString stringWithFormat:@"%d", user.userID];
    parameters = @{ @"session[uid]": userID,
                    @"session[sid]": user.sessionID };
    [self.manager
     POST:[NSString stringWithFormat:@"%@/flow/checkOrder",
           self.config.backendURL]
     parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestConsigneesWithUser:user didReceiveResponse:responseObject
                                   error:nil];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self requestConsigneesWithUser:user didReceiveResponse:nil
                                   error:error];
     }];
}

- (void)requestConsigneesWithUser:(User *)user
               didReceiveResponse:(id)responseObject error:(NSError *)anError
{
    NSError *error;
    error = anError == nil ? [self.assembler error:responseObject] : anError;
    
    
}
@end
