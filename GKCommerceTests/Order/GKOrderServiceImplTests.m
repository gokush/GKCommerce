//
//  GKOrderServiceImplTests.m
//  GKCommerce
//
//  Created by 小悟空 on 3/12/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GKOrderServiceImpl.h"
#import <OCMock/OCMock.h>

@interface GKOrderServiceImplTests : XCTestCase
@property (strong, nonatomic) id<GKOrderService> service;
@end

@implementation GKOrderServiceImplTests

- (void)setUp {
    [super setUp];
    
    self.service = [[GKOrderServiceImpl alloc] init];
}

- (void)testOrders
{
    id backend = OCMProtocolMock(@protocol(GKOrderBackend));
    RACSignal *receiver =
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        Order *order = [[Order alloc] init];
        [subscriber sendNext:order];
        [subscriber sendCompleted];
        return nil;
    }];
    OCMStub([backend requestOrders:[OCMArg any]]).andReturn(receiver);
    self.service.backend = backend;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [[self.service orders:nil] subscribeNext:^(Order *order) {
        dispatch_semaphore_signal(semaphore);
        XCTAssert(YES);
    }];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW + 500.0f);
}

@end
