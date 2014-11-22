//
//  ProductSpecificationValue.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-4.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductSpecificationValue.h"

@implementation ProductSpecificationValue

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        self.label = [aDecoder decodeObjectForKey:@"label"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.label forKey:@"label"];
}

@end
