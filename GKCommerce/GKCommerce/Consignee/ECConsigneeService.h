//
//  ECConsigneeService.h
//  GKCommerce
//
//  Created by 小悟空 on 12/16/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsigneeService.h"

@interface ECConsigneeService : NSObject
<ConsigneeService, ConsigneeBackendDelegate>

@property (strong, nonatomic) id<ConsigneeServiceDelegate> delegate;
@property (strong, nonatomic) id<ConsigneeBackend> backend;
- (void)consigneesWithUser:(User *)user;
- (void)consigneeWithID:(NSInteger)consigneeID user:(User *)anUser;
@end
