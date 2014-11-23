//
//  ECUserBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "UserBackend.h"
#import "ECUserBackendAssembler.h"

@interface ECUserBackend : UserBackend

@property (strong, nonatomic) ECUserBackendAssembler *assembler;
@end
