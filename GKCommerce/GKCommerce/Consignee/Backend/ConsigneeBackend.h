//
//  ConsigneeBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsigneeBackendDelegate.h"
#import "Address.h"

@protocol ConsigneeBackend <NSObject>

@property (strong, nonatomic) id<ConsigneeBackendDelegate> delegate;
- (void)requestConsigneesWithUser:(User *)user;
- (void)requestConsigneeWithID:(NSInteger)consigneeID user:(User *)user;
@end
