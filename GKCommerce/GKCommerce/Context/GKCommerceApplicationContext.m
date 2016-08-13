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

#import "GKUserBackend.h"
#import "GKUserService.h"

#import "GKUserBackendImpl.h"
#import "GKUserBackendMock.h"
#import "GKUserServiceImpl.h"
#import "GKUserAuthenticationController.h"
#import "GKRegistrationController.h"

#import "GKFeatureBackend.h"
#import "GKFeatureService.h"

#import "GKAddressBackendMock.h"
#import "GKAddressServiceImpl.h"

@implementation GKCommerceApplicationContext

- (void)configure
{
    [self bindClass:[GKUserBackendMock class]
         toProtocol:@protocol(GKUserBackend)];
    [self bindClass:[GKUserServiceImpl class]
         toProtocol:@protocol(GKUserService)];
    
    
    [self bindClass:[GKCheckoutBackendDemostration class]
    toProtocol:@protocol(GKCheckoutBackend)];
    
    [self bindClass:[GKCheckoutServiceImpl class]
    toProtocol:@protocol(GKCheckoutService)];
    
    [self bindProvider:[[CheckoutViewControllerProvider alloc] init]
               toClass:[CheckoutViewController class]];
    
    [self bindClass:[GKFeatureBackend class] toProtocol:@protocol(FeatureBackend)];
    [self bindClass:[GKFeatureService class] toProtocol:@protocol(FeatureService)];
    
    
    [self bindClass:[GKAddressBackendMock class] toProtocol:@protocol(GKAddressBackend)];
    [self bindClass:[GKAddressServiceImpl class] toProtocol:@protocol(GKAddressService)];
}

+ (void)install
{
    JSObjectionInjector *injector;
    GKCommerceApplicationContext *context;
    context = [[GKCommerceApplicationContext alloc] init];
    injector = [JSObjection createInjector:context];
    
//    id<GKCheckoutService> service;
//    service = [injector getObject:@protocol(GKCheckoutService)];
    
//    id<FeatureService> service;
//    service = [injector getObject:@protocol(FeatureService)];

    id<GKAddressService> service;
    service = [injector getObject:@protocol(GKAddressService)];
    
    [JSObjection setDefaultInjector:injector];
}
@end
