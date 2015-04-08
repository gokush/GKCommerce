//
//  GKAddressContainerMock.h
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/21/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKAddressContainer.h"

@interface GKAddressContainerMock : NSObject

- (id<GKRegionBackend>)regionBackend;
- (id<GKAddressService>)addressService;
- (id<GKAddressBackend>)addressBackend;
- (id<GKAddressRepository>)addressRepository;
@end
