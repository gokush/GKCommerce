//
//  Shop.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKUser.h"
#import "ShippingMethod.h"

@class Product;
@interface Store : NSObject

@property (assign, nonatomic) NSInteger storeID;
@property (strong, nonatomic) NSMutableArray *products;
@property (strong, nonatomic) NSMutableArray *shippingMethods;
@property (strong, nonatomic) NSMutableArray *payments;

- (void)addProduct:(Product *)product;
- (Product *)productWithID:(NSInteger)productID;
@end
