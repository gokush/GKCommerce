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

#import "CheckoutViewControllerProvider.h"
#import "CheckoutViewController.h"

@implementation GKCommerceApplicationContext

- (void)configure
{
    [self bindClass:[GKCheckoutBackendDemostration class]
    toProtocol:@protocol(GKCheckoutBackend)];
    
    [self bindClass:[GKCheckoutServiceImpl class]
    toProtocol:@protocol(GKCheckoutService)];
    
    [self bindProvider:[[CheckoutViewControllerProvider alloc] init]
               toClass:[CheckoutViewController class]];
}

+ (void)install
{
    JSObjectionInjector *injector;
    GKCommerceApplicationContext *context;
    context = [[GKCommerceApplicationContext alloc] init];
    injector = [JSObjection createInjector:context];
    
    id<GKCheckoutService> service;
    service = [injector getObject:@protocol(GKCheckoutService)];
    
    [JSObjection setDefaultInjector:injector];
}
@end
