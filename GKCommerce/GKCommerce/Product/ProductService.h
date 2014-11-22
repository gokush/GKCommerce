//
//  ProductService.h
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Product.h"
#import "ProductRepository.h"
#import "ProductBackend.h"
#import "ProductBackendDelegate.h"
#import "ProductServiceDelegate.h"

@interface ProductService : NSObject <ProductBackendDelegate>

@property (strong, nonatomic) ProductRepository *repository;
@property (retain, nonatomic) id<ProductBackend> backend;
@property (strong, nonatomic) id<ProductServiceDelegate> delegate;
- (void)productWithID:(NSInteger)productID user:(User *)anUser;
+ (instancetype)shared;
@end
