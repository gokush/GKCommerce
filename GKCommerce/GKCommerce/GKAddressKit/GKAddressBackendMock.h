//
//  GKAddressBackendMock.h
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/21/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKAddress.h"
#import "GKAddressBackend.h"

@interface GKAddressBackendMock : NSObject <GKAddressBackend>

- (RACSignal *)fetchAddressesWithToken:(NSString *)token;
@end
