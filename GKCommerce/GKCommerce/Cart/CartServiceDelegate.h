//
//  CartServiceDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 11/23/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cart.h"

@class CartService;
@protocol CartServiceDelegate <NSObject>

- (void)cartService:(CartService *)aCartService cart:(Cart *)aCart
              error:(NSError *)anError;
@end
