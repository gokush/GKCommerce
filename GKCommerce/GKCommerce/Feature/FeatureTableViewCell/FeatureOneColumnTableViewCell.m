//
//  FeatureProductTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 14-10-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "FeatureOneColumnTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FeatureOneColumnTableViewCell()
{
    NSString *modelName;
}
@end

@implementation FeatureOneColumnTableViewCell

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (void)setModel:(FeatureOneColumnModel *)model
{
    _model = model;
    self.title.text = model.title;
    [self.picture sd_setImageWithURL:model.picture];
}

- (void)awakeFromNib {
}
@end
