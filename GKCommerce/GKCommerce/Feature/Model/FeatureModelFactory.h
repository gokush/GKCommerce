//
//  FeatureModelFactory.h
//  WKCommerce
//
//  Created by 小悟空 on 14-10-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeatureViewModel.h"
#import "FeatureColumnModel.h"
#import "FeatureCarouselModel.h"

@interface FeatureModelFactory : NSObject

- (FeatureViewModel *)featureModelWithJSON:(NSDictionary *)JSON;
@end
