//
//  GKUserBackendImpl.h
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKUserBackend.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <AFNetworking/AFNetworking.h>

@interface GKUserBackendImpl : NSObject <GKUserBackend>

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;

- (RACSignal *)signup:(GKUserRegistration *)user;
@end
