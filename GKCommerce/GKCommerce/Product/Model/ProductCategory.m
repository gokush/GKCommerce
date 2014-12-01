//
//  Category.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-10-11.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductCategory.h"

@implementation ProductCategory
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[NSNumber numberWithInt:self.categoryID]
                  forKey:@"categoryID"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.categoryDescription forKey:@"categoryDescription"];
    [aCoder encodeObject:self.children forKey:@"children"];
    [aCoder encodeObject:self.cover forKey:@"cover"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        self.categoryID = [[aDecoder decodeObjectForKey:@"categoryID"]
                          integerValue];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.categoryDescription = [aDecoder
                                   decodeObjectForKey:@"categoryDescription"];
        self.children = [aDecoder decodeObjectForKey:@"children"];
        self.cover = [aDecoder decodeObjectForKey:@"cover"];
    }
    return self;
}


- (NSArray *)namesOfChildren
{
    NSMutableArray *names = [[NSMutableArray alloc] init];
    
    for (ProductCategory *child in self.children)
        [names addObject:child.name];
    
    return names;
}
@end
