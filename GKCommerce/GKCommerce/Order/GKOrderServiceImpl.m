//
//  GKOrderServiceImpl.m
//  GKCommerce
//
//  Created by 小悟空 on 3/11/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKOrderServiceImpl.h"
#import <Objection/Objection.h>

@implementation GKOrderServiceImpl
objection_requires_sel(@selector(backend))

- (RACSignal *)orders:(GKUser *)user
{
    return [self.backend requestOrders:user];
}
@end
