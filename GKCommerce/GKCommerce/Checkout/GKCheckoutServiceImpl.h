//
//  GKCheckoutServiceImpl.h
//  GKCommerce
//
//  Created by 小悟空 on 3/9/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKCheckoutService.h"

@interface GKCheckoutServiceImpl : NSObject <GKCheckoutService>

@property (strong, nonatomic) id<GKCheckoutBackend> backend;
- (RACSignal *)checkout:(Cart *)cart;
@end
