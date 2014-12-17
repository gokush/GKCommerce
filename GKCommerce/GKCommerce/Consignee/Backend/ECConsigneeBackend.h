//
//  ECConsigneeBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "Backend.h"
#import "ConsigneeBackend.h"
#import "ECConsigneeBackendAssembler.h"

@interface ECConsigneeBackend : Backend <ConsigneeBackend>

@property (strong, nonatomic) id<ConsigneeBackendDelegate> delegate;
@property (strong, nonatomic) ECConsigneeBackendAssembler *assembler;
- (void)requestConsigneesWithUser:(User *)user;
- (void)requestConsigneeWithID:(NSInteger)consigneeID user:(User *)user;
@end
