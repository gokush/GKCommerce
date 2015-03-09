//
//  GKCheckoutServiceImpl.m
//  GKCommerce
//
//  Created by 小悟空 on 3/9/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKCheckoutServiceImpl.h"
#import <Objection/Objection.h>

@implementation GKCheckoutServiceImpl

objection_requires_sel(@selector(backend))

- (RACSignal *)checkout:(Cart *)cart
{
    return [self.backend requestCheckout:cart];
//    return
//    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        
//        return (RACDisposable *)nil;
//    }];
}
@end
