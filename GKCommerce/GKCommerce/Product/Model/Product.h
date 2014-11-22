//
//  Product.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-8.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductImageURL.h"

@interface Product : NSObject <NSCoding>

@property (nonatomic, assign) NSInteger productID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDecimalNumber *marketPrice;
@property (nonatomic, strong) NSDecimalNumber *price;
@property (nonatomic, assign) int stocks;
@property (nonatomic, strong) ProductImageURL *image;
@property (nonatomic, strong) NSArray *pictures;
@property (nonatomic, strong) NSString *productDescription;
@property (nonatomic, assign) BOOL favored;
@property (nonatomic, strong) NSArray *specifications;
@property (nonatomic, assign) BOOL onSale;
@end
