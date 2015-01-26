//
//  GKProductServiceImpl.h
//  GKCommerce
//
//  Created by 小悟空 on 1/13/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKProductService.h"
#import "GKProductBackendImpl.h"

@interface GKProductServiceImpl : NSObject <GKProductService>

- (RACSignal *)productWithID:(NSInteger)productID user:(User *)anUser;
- (RACSignal *)productCategories;
- (RACSignal *)productsWithSearchModel:(SearchBackendModel *)searchModel;
@end
