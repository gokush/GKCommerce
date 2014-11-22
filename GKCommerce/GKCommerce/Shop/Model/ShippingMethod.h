//
//  Shipping.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/1.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShippingMethod : NSObject

@property (assign, nonatomic) NSInteger shippingID;
@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) BOOL cashOnDelivery;
@property (strong, nonatomic) NSDecimalNumber *freight;
@end
