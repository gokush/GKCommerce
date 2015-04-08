//
//  GKAddressRepositoryMock.h
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/23/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKAddressRepository.h"

@interface GKAddressRepositoryMock : NSObject <GKAddressRepository>

@property (assign, nonatomic) BOOL createWillSuccess;
@property (assign, nonatomic) BOOL updateWillSuccess;

- (RACSignal *)findAddressesWithUser:(GKUser *)user;
- (RACSignal *)create:(GKAddress *)address;
- (RACSignal *)update:(GKAddress *)address;
- (RACSignal *)addQueue:(GKAddress *)address queue:(GKAddressQueue)aQueue;
- (RACSignal *)removeQueue:(GKAddress *)address queue:(GKAddressQueue)aQueue;
- (RACSignal *)queues;
@end
