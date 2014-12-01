//
//  ProductBackendDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "ProductBackend.h"

@protocol ProductBackend;
@protocol ProductBackendDelegate <NSObject>

- (void)productBackend:(id<ProductBackend>)aProductBackend
     didReceiveProduct:(Product *)aProduct error:(NSError *)anError;

- (void)productBackend:(id<ProductBackend>)aProductBackend
     didReceiveProduct:(Product *)product description:(NSString *)aDescription
                 error:(NSError *)anError;

- (void)productBackend:(id<ProductBackend>)aProductBackend
    didReceiveProducts:(NSArray *)products
           searchModel:(SearchBackendModel *)aSearchModel
                 error:(NSError *)anError;

- (void)productBackend:(id<ProductBackend>)aProductBackend
  didReceiveCategories:(NSArray *)categories error:(NSError *)anError;
@end
