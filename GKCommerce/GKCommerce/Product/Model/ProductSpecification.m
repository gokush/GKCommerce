//
//  ProductSpecification.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-4.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductSpecification.h"

@implementation ProductSpecification

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.value = [aDecoder decodeObjectForKey:@"value"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.value forKey:@"value"];
}
@end
