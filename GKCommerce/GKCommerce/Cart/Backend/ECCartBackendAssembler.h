//
//  ECCartBackendAssembler.h
//  GKCommerce
//
//  Created by 小悟空 on 11/23/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECBackendAssembler.h"
#import "ECProductBackendAssembler.h"

@interface ECCartBackendAssembler : ECBackendAssembler

@property (strong, nonatomic) ECProductBackendAssembler *productAssembler;

- (Cart *)cartWithJSON:(NSDictionary *)JSON user:(User *)anUser;
@end
