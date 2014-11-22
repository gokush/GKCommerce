//
//  Product.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-8.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "Product.h"

@implementation Product

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        self.stocks = [[aDecoder decodeObjectForKey:@"stocks"] integerValue];
        self.favored = [[aDecoder decodeObjectForKey:@"favored"] boolValue];
        self.onSale = [[aDecoder decodeObjectForKey:@"isOnSale"] boolValue];
        self.productID = [[aDecoder decodeObjectForKey:@"productID"]
                          integerValue];

        for (NSString *key in @[@"name", @"marketPrice", @"price",
                                @"promotePrice", @"image", @"pictures",
                                @"productDescription", @"specifications",
                                @"directSupplyPrice"]) {
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    NSNumber *encodedStocks, *encodedFavor, *encodedOnSale, *encodedProductID;
    
    encodedStocks = [[NSNumber alloc] initWithInt:self.stocks];
    encodedFavor = [[NSNumber alloc] initWithBool:self.favored];
    encodedOnSale = [[NSNumber alloc] initWithBool:self.onSale];
    encodedProductID = [[NSNumber alloc] initWithInteger:self.productID];
    
    [aCoder encodeObject:encodedStocks forKey:@"stocks"];
    [aCoder encodeObject:encodedFavor forKey:@"favored"];
    [aCoder encodeObject:encodedOnSale forKey:@"onSale"];
    [aCoder encodeObject:encodedProductID forKey:@"productID"];

    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.marketPrice forKey:@"marketPrice"];
    [aCoder encodeObject:self.price forKey:@"price"];
    [aCoder encodeObject:self.image forKey:@"image"];
    [aCoder encodeObject:self.pictures forKey:@"pictures"];
    [aCoder encodeObject:self.productDescription forKey:@"productDescription"];
    [aCoder encodeObject:self.specifications forKey:@"specifications"];
}
@end
