//
//  ProductServiceDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@protocol ProductService;
@protocol ProductServiceDelegate <NSObject>

@optional
- (void)productService:(id<ProductService>)aProductService
               product:(Product *)aProduct error:(NSError *)anError;

- (void)productService:(id<ProductService>)aProductService
               product:(Product *)aProduct description:(NSString *)aDescription
                 error:(NSError *)anError;

- (void)productService:(id<ProductService>)aProductService
              products:(NSArray *)aProducts
           searchModel:(SearchBackendModel *)aSearchModel
                 error:(NSError *)anError;
@end
