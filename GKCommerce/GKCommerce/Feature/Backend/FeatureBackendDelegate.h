//
//  FeatureBackendDelegate.h
//  GKCommerce
//
//  Created by Goku on 14/12/1.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeatureViewModel.h"

@protocol FeatureBackend;
@protocol FeatureBackendDelegate <NSObject>

- (void)featureBackend:(id<FeatureBackend>)aFeatureBackend
didReceiveFeature:(FeatureViewModel *)feature;
@end
