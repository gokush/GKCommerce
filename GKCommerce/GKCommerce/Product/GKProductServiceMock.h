//
//  GKProductServiceMock.h
//  GKCommerce
//
//  Created by 小悟空 on 1/22/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKServiceMock.h"

@interface GKProductServiceMock : GKServiceMock <GKProductService>

- (RACSignal *)productWithID:(NSInteger)productID user:(User *)anUser;
- (RACSignal *)productCategories;
@end
