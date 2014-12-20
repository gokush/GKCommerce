//
//  AddressServiceDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AddressService;
@protocol AddressServiceDelegate <NSObject>

@optional
- (void)addressService:(id<AddressService>)anAddressService
                  user:(User *)anUser addresses:(NSArray *)anAddresses
                 error:(NSError *)anError;

- (void)addressService:(id<AddressService>)anAddressService
                  user:(User *)anUser address:(Address *)anAddress
                 error:(NSError *)anError;
@end
