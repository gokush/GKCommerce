//
//  FeatureOneColumnCellModel.h
//  GKCommerce
//
//  Created by 小悟空 on 14-10-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeatureColumnModel.h"

@interface FeatureOneColumnModel : FeatureColumnModel

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSURL *picture;
@property (strong, nonatomic) NSURL *link;
@end
