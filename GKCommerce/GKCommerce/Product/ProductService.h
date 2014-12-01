//
//  ProductService.h
//  GKCommerce
//
//  Created by 小悟空 on 11/29/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "ProductBackend.h"
#import "ProductServiceDelegate.h"

@protocol ProductService <NSObject>

@property (strong, nonatomic) id<ProductServiceDelegate> delegate;
@optional
- (void)productWithID:(NSInteger)productID user:(User *)anUser;
- (void)productDescription:(Product *)product;
- (void)productsWithSearchModel:(SearchBackendModel *)searchModel;
- (void)productCategories;
@end
