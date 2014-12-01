//
//  GKFeatureBackendAssembler.h
//  GKCommerce
//
//  Created by Goku on 14/12/1.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeatureViewModel.h"
#import "FeatureColumnModel.h"
#import "FeatureCarouselModel.h"

@interface GKFeatureBackendAssembler : NSObject

- (FeatureViewModel *)featureModelWithJSON:(NSDictionary *)JSON;
@end
