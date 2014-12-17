
//
//  ConsigneeBackendDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Address;
@protocol ConsigneeBackend;
@protocol ConsigneeBackendDelegate <NSObject>

- (void)consigneeBackend:(id<ConsigneeBackend>)consigneeBackend
                    user:(User *)anUser
    didReceiveConsignees:(NSArray *)consignees error:(NSError *)anError;

- (void)consigneeBackend:(id<ConsigneeBackend>)consigneeBackend
                    user:(User *)anUser
     didReceiveConsignee:(Address *)consignee error:(NSError *)anError;
@end
