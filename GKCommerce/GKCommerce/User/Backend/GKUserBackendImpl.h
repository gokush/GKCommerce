//
//  GKUserBackendImpl.h
//  GKCommerce
//
//  Created by 小悟空 on 1/15/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "Backend.h"
#import "GKUserAssembler.h"

@interface GKUserBackendImpl : Backend

@property (strong, nonatomic) GKUserAssembler *assembler;
- (RACSignal *)requestAuthenticate:(UserAuthenticationModel *)user;
- (RACSignal *)requestUser:(User *)user;
@end
