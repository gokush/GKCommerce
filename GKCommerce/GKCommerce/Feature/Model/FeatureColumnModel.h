//
//  FeatureCellModel.h
//  WKCommerce
//
//  Created by 小悟空 on 14-10-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    FeatureOneColumn
} FeatureColumn;

@interface FeatureColumnModel : NSObject

@property (assign, nonatomic) FeatureColumn type;
@end
