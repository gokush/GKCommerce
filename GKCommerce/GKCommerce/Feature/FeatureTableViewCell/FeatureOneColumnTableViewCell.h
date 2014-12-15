//
//  FeatureProductTableViewCell.h
//  GKCommerce
//
//  Created by 小悟空 on 14-10-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeatureTableViewCell.h"
#import "FeatureOneColumnModel.h"

@interface FeatureOneColumnTableViewCell : FeatureTableViewCell

@property (strong, nonatomic) FeatureOneColumnModel *model;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIImageView *picture;
@end
