//
//  GKProductBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 1/9/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Backend.h"
#import "GKProductBackend.h"
#import "GKProductBackendAssembler.h"

@interface GKProductBackendImpl : Backend <GKProductBackend>

@property (strong, nonatomic) GKProductBackendAssembler *assembler;
- (RACSignal *)requestProductWithID:(NSInteger)productID user:(User *)anUser;
@end
