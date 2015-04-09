//
//  GKUserServiceImpl.m
//  GKUserKitExample
//
//  Created by SeanChense on 15/2/23.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "GKUserServiceImpl.h"
#import "GKUser.h"
#import "GKUserRepository.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Objection/Objection.h>

@interface GKUserServiceImpl()
@end

@implementation GKUserServiceImpl
objection_requires_sel(@selector(backend))


- (RACSignal *)signup:(GKUserRegistration *)registration
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    [[self.backend signup:registration] subscribeNext:^(GKUser *user) {

        [self.repository create:user];
        [subscriber sendNext:user];
        [subscriber sendCompleted];
        
    } error:^(NSError *error) {
        [subscriber sendError:error];
    }];
    
    return (RACDisposable *)nil;
  }];
}

- (RACSignal *)authenticate:(GKUserAuthentication *)authentication
{
    return [self.backend authencate:authentication];
}
@end
