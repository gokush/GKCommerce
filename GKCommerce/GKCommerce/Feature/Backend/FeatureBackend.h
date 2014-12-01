//
//  FeatureBackend.h
//  GKCommerce
//
//  Created by Goku on 14/12/1.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeatureBackendDelegate.h"

@protocol FeatureBackend <NSObject>

@property (strong, nonatomic) id<FeatureBackendDelegate> delegate;
- (void)requestFeature;
@end
