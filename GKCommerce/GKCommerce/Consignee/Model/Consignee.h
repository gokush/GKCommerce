//
//  Consignee.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Area.h"

@interface Consignee : NSObject

@property (assign, nonatomic) NSInteger *consigneeID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *cellPhone;
@property (strong, nonatomic) NSString *postcode;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) Area *province;
@property (strong, nonatomic) Area *city;
@property (strong, nonatomic) Area *district;
@property (assign, nonatomic) BOOL defaultConsignee;
@end
