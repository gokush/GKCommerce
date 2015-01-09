//
//  GKProductBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 1/9/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Backend.h"
#import "ProductBackend.h"
#import "GKProductBackendAssembler.h"

@interface GKProductBackend : Backend <ProductBackend>

@property (strong, nonatomic) GKProductBackendAssembler *assembler;
- (RACSignal *)productWithID:(NSInteger)productID user:(User *)anUser;
@end
