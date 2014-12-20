//
//  AddressBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressBackendDelegate.h"
#import "Address.h"

@protocol AddressBackend <NSObject>

@property (strong, nonatomic) id<AddressBackendDelegate> delegate;
- (void)requestAddressesWithUser:(User *)user;
- (void)requestAddressWithID:(NSInteger)addressID user:(User *)user;
@end
