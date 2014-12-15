//
//  FeatureThreeColumnCell.h
//  GKCommerce
//
//  Created by 小悟空 on 14-10-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeatureTableViewCell.h"
#import "FeatureTableViewCellColumn.h"
#import "FeatureThreeColumnModel.h"

@interface FeatureThreeColumnTableViewCell : FeatureTableViewCell

@property (strong, nonatomic) FeatureThreeColumnModel *model;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIView *columnView;
@end
