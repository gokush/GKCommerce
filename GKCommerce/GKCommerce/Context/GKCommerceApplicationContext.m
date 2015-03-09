//
//  GKApplicationContext.m
//  GKCommerce
//
//  Created by 小悟空 on 3/9/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKCommerceApplicationContext.h"

#import "GKCheckoutBackend.h"
#import "GKCheckoutService.h"

#import "GKCheckoutBackendDemostration.h"
#import "GKCheckoutServiceImpl.h"

#import "CheckoutViewController.h"

@implementation GKCommerceApplicationContext

- (void)configure
{
    [self bind:[GKCheckoutBackendDemostration class]
    toProtocol:@protocol(GKCheckoutBackend)];
    
    [self bind:[GKCheckoutServiceImpl class]
    toProtocol:@protocol(GKCheckoutService)];
    
    Class checkoutController = [CheckoutViewController class];
    [self bindClass:[CheckoutViewController class] toClass:[CheckoutViewController class]];
}

+ (void)install
{
    JSObjectionInjector *injector;
    GKCommerceApplicationContext *context;
    context = [[GKCommerceApplicationContext alloc] init];
    injector = [JSObjection createInjector:context];
    
    [JSObjection setDefaultInjector:injector];
}
@end
