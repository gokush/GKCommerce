
//
//  AddressBackendDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Address;
@protocol AddressBackend;
@protocol AddressBackendDelegate <NSObject>

- (void)addressBackend:(id<AddressBackend>)anAddressBackend user:(User *)anUser
   didReceiveAddresses:(NSArray *)addresses error:(NSError *)anError;

- (void)addressBackend:(id<AddressBackend>)anAddressBackend user:(User *)anUser
     didReceiveAddress:(Address *)address error:(NSError *)anError;
@end
