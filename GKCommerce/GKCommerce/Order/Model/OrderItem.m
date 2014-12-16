//
//  OrderItem.m
//  GKCommerce
//
//  Created by Goku on 14/12/2.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "OrderItem.h"

@implementation OrderItem

- (id)initWithOrder:(Order *)order
{
    self = [self init];
    if (self) {
        self.order = order;
    }
    return self;
}
@end
