//
//  Category.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-10-11.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "Catalog.h"

@implementation Catalog
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[NSNumber numberWithInt:self.catalogID]
                  forKey:@"catalogID"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.catalogDescription forKey:@"catalogDescription"];
    [aCoder encodeObject:self.children forKey:@"children"];
    [aCoder encodeObject:self.cover forKey:@"cover"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        self.catalogID = [[aDecoder decodeObjectForKey:@"catalogID"]
                          integerValue];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.catalogDescription = [aDecoder
                                   decodeObjectForKey:@"catalogDescription"];
        self.children = [aDecoder decodeObjectForKey:@"children"];
        self.cover = [aDecoder decodeObjectForKey:@"cover"];
    }
    return self;
}


- (NSArray *)namesOfChildren
{
    NSMutableArray *names = [[NSMutableArray alloc] init];
    
    for (Catalog *child in self.children)
        [names addObject:child.name];
    
    return names;
}
@end
