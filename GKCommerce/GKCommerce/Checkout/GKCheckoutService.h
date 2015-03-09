//
//  CheckoutService.h
//  GKCommerce
//
//  Created by 小悟空 on 3/9/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKCheckoutBackend.h"

@protocol GKCheckoutService <NSObject>

@property (strong, nonatomic) id<GKCheckoutBackend> backend;
- (RACSignal *)checkout:(Cart *)cart;
@end
