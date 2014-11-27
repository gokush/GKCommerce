//
//  ECUserBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "Backend.h"
#import "UserBackend.h"
#import "ECUserBackendAssembler.h"

@interface ECUserBackend : Backend <UserBackend>

@property (strong, nonatomic) id<UserBackendDelegate> delegate;
@property (strong, nonatomic) ECUserBackendAssembler *assembler;
+ (instancetype)shared;
@end
