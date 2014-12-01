//
//  GKFeatureService.h
//  GKCommerce
//
//  Created by Goku on 14/12/1.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "Backend.h"
#import "FeatureService.h"

@interface GKFeatureService : Backend <FeatureService, FeatureBackendDelegate>

@property (strong, nonatomic) id<FeatureServiceDelegate> delegate;
@property (strong, nonatomic) id<FeatureBackend> backend;

- (void)feature;
@end
