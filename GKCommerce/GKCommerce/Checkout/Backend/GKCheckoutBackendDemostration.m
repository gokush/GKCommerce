//
//  GKCheckoutBackendDemostration.m
//  GKCommerce
//
//  Created by 小悟空 on 3/9/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKCheckoutBackendDemostration.h"

@implementation GKCheckoutBackendDemostration

- (id)init
{
    self = [super init];
    if (self) {
        self.foreverSuccess = YES;
    }
    return self;
}

- (RACSignal *)requestCheckout:(Cart *)cart
{
    return
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        Order *order = [[Order alloc] init];
        
        if (self.foreverSuccess) {
            [subscriber sendNext:order];
            [subscriber sendCompleted];
        } else {
            [subscriber sendError:[self checkoutFailure]];
        }
        
        return (RACDisposable *)nil;
    }];
}

- (NSError *)checkoutFailure
{
    NSError *error;
    error = [NSError
             errorWithDomain:@"Checkout"
             code:1
             userInfo:@{NSLocalizedDescriptionKey: @"因为演示模式，支付失败"}];
    return error;
}
@end
