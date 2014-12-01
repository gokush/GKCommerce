//
//  FeatureServiceDelegate.h
//  GKCommerce
//
//  Created by Goku on 14/12/1.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeatureViewModel.h"

@protocol FeatureService;
@protocol FeatureServiceDelegate <NSObject>

- (void)featureService:(id<FeatureService>)service
               feature:(FeatureViewModel *)aFeature;
@end
