//
//  ECConsigneeService.m
//  GKCommerce
//
//  Created by 小悟空 on 12/16/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECConsigneeService.h"

@implementation ECConsigneeService

- (id)init
{
    self = [super init];
    if (self) {
        self.backend = [[Dependency shared] consigneeBackend];
    }
    return self;
}

- (void)consigneesWithUser:(User *)user
{
    [self.backend requestConsigneesWithUser:user];
}

- (void)consigneeBackend:(id<ConsigneeBackend>)consigneeBackend
                    user:(User *)anUser
    didReceiveConsignees:(NSArray *)consignees error:(NSError *)anError
{
    SEL selector;
    selector = @selector(consigneeService:user:consignees:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate consigneeService:self user:anUser consignees:consignees
                                  error:anError];
}

- (void)consigneeWithID:(NSInteger)consigneeID user:(User *)anUser
{
    [self.backend requestConsigneeWithID:consigneeID user:anUser];
}

- (void)consigneeBackend:(id<ConsigneeBackend>)consigneeBackend
                    user:(User *)anUser
     didReceiveConsignee:(Address *)consignee error:(NSError *)anError
{
    
}
@end
