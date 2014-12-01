//
//  ECProductBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ProductBackend.h"
#import "ECProductBackendAssembler.h"
#import "ProductBackendDelegate.h"

@interface ECProductBackend : Backend <ProductBackend>

@property (strong, nonatomic) ECProductBackendAssembler *assembler;
@property (strong, nonatomic) id<ProductBackendDelegate> delegate;

- (void)requestProductWithID:(NSInteger)productID user:(User *)anUser;
- (void)requestProductDescription:(Product *)product;
- (void)requestProductsWithSearchModel:(SearchBackendModel *)searchModel;
- (void)requestProductCategories;
@end
