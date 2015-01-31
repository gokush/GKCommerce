//
//  GKCartBackendImpl.h
//  GKCommerce
//
//  Created by 小悟空 on 1/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "Backend.h"

@interface GKCartBackendImpl : Backend <GKCartBackend>

- (RACSignal *)requestCartWithUser:(User *)user;
- (RACSignal *)requestAddItem:(CartItem *)item;
- (RACSignal *)requestUpdateItem:(CartItem *)item
                     oldQuantity:(NSInteger)anOldQuantity;
- (RACSignal *)requestRemoveItem:(CartItem *)item;
@end
