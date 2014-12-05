//
//  Shop.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "Store.h"

@interface Store()
{
    NSMutableDictionary *productMap;
}

@end

@implementation Store

- (id)init
{
    self = [super init];
    if (self) {
        productMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addProduct:(Product *)product
{
    [self.products addObject:product];
    [productMap setValue:product
                  forKey:[NSString stringWithFormat:@"%d", product.productID]];
}

- (Product *)productWithID:(NSInteger)productID
{
    return (Product *)[productMap
        objectForKey:[NSString stringWithFormat:@"%d", productID]];
}
@end
