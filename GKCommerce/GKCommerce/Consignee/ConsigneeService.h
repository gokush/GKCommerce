//
//  ConsigneeService.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsigneeServiceDelegate.h"

@protocol ConsigneeService <NSObject>

@property (strong, nonatomic) id<ConsigneeServiceDelegate> delegate;
- (void)consignees;
@end
