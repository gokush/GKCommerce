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

- (void)productService:(id<ProductService>)aProductService
               product:(Product *)aProduct error:(NSError *)anError;
@end
