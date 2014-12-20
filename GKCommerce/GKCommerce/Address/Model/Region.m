//
//  Area.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "Region.h"

@implementation Region

- (NSString *)description
{
    NSMutableString *description;
    if (self.parent)
        description = [[NSMutableString alloc]
                       initWithString:[self.parent description]];
    else
        description = [[NSMutableString alloc] init];

    [description appendString:self.name];
    
    return description;
}

@end
