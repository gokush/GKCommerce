//
//  GKFeatureBackend.h
//  GKCommerce
//
//  Created by Goku on 14/12/1.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "Backend.h"
#import "FeatureBackend.h"
#import "GKFeatureBackendAssembler.h"

@interface GKFeatureBackend : Backend <FeatureBackend>

@property (strong, nonatomic) id<FeatureBackendDelegate> delegate;
@property (strong, nonatomic) GKFeatureBackendAssembler *assembler;
- (void)requestFeature;
@end
