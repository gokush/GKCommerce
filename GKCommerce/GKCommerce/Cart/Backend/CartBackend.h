//
//  CartBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 11/23/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartBackendDelegate.h"

@protocol CartBackend <NSObject>

@required
@property (strong, nonatomic) id<CartBackendDelegate> delegate;
- (void)requestCartWithUser:(User *)user;
- (void)requestAddItem:(CartItem *)item;
- (void)requestUpdateItem:(CartItem *)item oldQuantity:(NSInteger)anOldQuantity;
- (void)requestRemoveItem:(CartItem *)item;
@end
