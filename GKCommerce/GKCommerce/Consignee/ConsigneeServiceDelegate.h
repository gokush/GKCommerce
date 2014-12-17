//
//  ConsigneeServiceDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ConsigneeService;
@protocol ConsigneeServiceDelegate <NSObject>

@optional
- (void)consigneeService:(id<ConsigneeService>)consigneeService
                    user:(User *)anUser
              consignees:(NSArray *)aConsignees error:(NSError *)anError;

- (void)consigneeService:(id<ConsigneeService>)consigneeService
                    user:(User *)anUser consignee:(Address *)aConsignee error:(NSError *)anError;
@end
