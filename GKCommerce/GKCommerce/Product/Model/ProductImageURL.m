//
//  ProductImage.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-8.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductImageURL.h"

@implementation ProductImageURL

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        self.small = [aDecoder decodeObjectForKey:@"small"];
        self.origin = [aDecoder decodeObjectForKey:@"origin"];
        self.thumbnail = [aDecoder decodeObjectForKey:@"thumbnail"];
    }
    return self;
}

- (id)initWithOrigin:(NSString *)origin
               small:(NSString *)aSmall
           thumbnail:(NSString *)aThumbnail
{
    self = [super init];
    
    if (self) {
        self.origin = origin;
        self.small = aSmall;
        self.thumbnail = aThumbnail;
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.origin forKey:@"origin"];
    [aCoder encodeObject:self.small forKey:@"small"];
    [aCoder encodeObject:self.thumbnail forKey:@"thumbnail"];
}
@end
