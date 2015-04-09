//
//  GKApplicationContext.m
//  GKUserKitExample
//
//  Created by 小悟空 on 3/7/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserApplicationContext.h"
#import "GKUserBackend.h"
#import "GKUserService.h"

#import "GKUserBackendImpl.h"
#import "GKUserBackendMock.h"
#import "GKUserServiceImpl.h"
#import "GKUserAuthenticationController.h"
#import "GKRegistrationController.h"

@implementation GKUserApplicationContext

@end

@implementation GKUserApplicationContextDemonstration

- (void)configure
{
    [self bindClass:[GKUserBackendMock class]
         toProtocol:@protocol(GKUserBackend)];
    [self bindClass:[GKUserServiceImpl class]
         toProtocol:@protocol(GKUserService)];
}
@end