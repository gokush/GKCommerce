//
//  GKCartServiceMock.h
//  GKCommerce
//
//  Created by 小悟空 on 1/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKCartServiceMock : NSObject

- (RACSignal *)fetchCartWithUser:(User *)user;
- (RACSignal *)addItem:(CartItem *)item;
- (RACSignal *)updateItem:(CartItem *)item oldQuantity:(NSInteger)anOldQuantity;
- (RACSignal *)removeItem:(CartItem *)item;
- (RACSignal *)removeItems:(NSArray *)items;
@end
