//
//  ProductBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 11/22/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKUser.h"
#import "SearchBackendModel.h"
#import "Backend.h"
#import "ProductBackendDelegate.h"

@protocol ProductBackend <NSObject>

@property (strong, nonatomic) id<ProductBackendDelegate> delegate;
- (void)requestProductWithID:(NSInteger)productID user:(GKUser *)anUser;
- (void)requestProductDescription:(Product *)product;
- (void)requestProductsWithSearchModel:(SearchBackendModel *)searchModel;
- (void)requestProductCategories;

- (RACSignal *)productWithID:(NSInteger)productID user:(GKUser *)anUser;
@end
