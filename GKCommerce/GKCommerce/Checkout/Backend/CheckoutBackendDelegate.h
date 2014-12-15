//
//  CheckoutBackendDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CheckoutBackend;
@protocol CheckoutBackendDelegate <NSObject>

- (void)checkoutBackend:(CheckoutBackend *)aCheckoutBackend
    didCompleteCheckout:(Order *)order;
@end
