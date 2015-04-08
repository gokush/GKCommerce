//
//  GKAddressBackendImpl.h
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/21/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKAddressBackend.h"

@interface GKAddressBackendImpl : NSObject <GKAddressBackend>

- (RACSignal *)fetchAddresses;
@end
