//
//  Consignee.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Region.h"

@interface Address : NSObject

@property (assign, nonatomic) NSInteger consigneeID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *cellPhone;
@property (strong, nonatomic) NSString *postcode;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) Region *province;
@property (strong, nonatomic) Region *city;
@property (strong, nonatomic) Region *district;
@property (assign, nonatomic) BOOL defaultConsignee;
@end
