//
//  GKProductService.h
//  GKCommerce
//
//  Created by 小悟空 on 1/13/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GKProductService <NSObject>
@optional
- (RACSignal *)productWithID:(NSInteger)productID user:(User *)anUser;
//- (void)productDescription:(Product *)product;
//- (void)productsWithSearchModel:(SearchBackendModel *)searchModel;
//- (void)productCategories;
@end
