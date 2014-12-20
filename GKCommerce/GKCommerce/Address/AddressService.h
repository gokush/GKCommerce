//
//  AddressService.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressServiceDelegate.h"

@protocol AddressService <NSObject>

@property (strong, nonatomic) id<AddressServiceDelegate> delegate;
- (void)addressesWithUser:(User *)user;
- (void)addressWithID:(NSInteger)addressID user:(User *)anUser;
@end
