//
//  ProductSpecification.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-4.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductSpecificationValue.h"

@interface ProductSpecification : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) ProductSpecificationValue *value;

@end
