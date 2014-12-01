//
//  ProductBackendAssembler.h
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "ProductSpecification.h"
#import "ECBackendAssembler.h"

@interface ECProductBackendAssembler : ECBackendAssembler

- (Product *)product:(NSDictionary *)JSON;
- (ProductImageURL *)productImageURL:(NSDictionary *)productImageURLJSON;
- (NSArray *)productImageURLs:(NSArray *)productImageURLJSON;
- (NSArray *)searchProducts:(NSArray *)productsJSON;
- (NSArray *)categories:(NSArray *)categoriesJSON;
@end
