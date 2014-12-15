
//
//  ConsigneeBackendDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ConsigneeBackend;
@protocol ConsigneeBackendDelegate <NSObject>

- (void)consigneeBackend:(ConsigneeBackend *)consigneeBackend
    didReceiveConsignees:(NSArray *)consignees error:(NSError *)anError;
@end
