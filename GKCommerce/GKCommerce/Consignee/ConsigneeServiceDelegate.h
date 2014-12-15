//
//  ConsigneeServiceDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ConsigneeService;
@protocol ConsigneeServiceDelegate <NSObject>

- (void)consigneeService:(ConsigneeService *)consigneeService
              consignees:(NSArray *)aConsignees error:(NSError *)anError;
@end
