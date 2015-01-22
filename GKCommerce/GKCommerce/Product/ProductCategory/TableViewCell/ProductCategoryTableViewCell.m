//
//  MallCategoryCell.m
//  goku-commerce.com
//
//  Created by wupeng on 8/8/14.
//  Copyright (c) 2014 小悟空. All rights reserved.
//

#import "ProductCategoryTableViewCell.h"
#import <UIImageView+WebCache.h>

@implementation ProductCategoryTableViewCell

- (void)awakeFromNib
{
  [super awakeFromNib];
  [RACObserve(self, productCategory)
   subscribeNext:^(ProductCategory *category) {
     self.nameLabel.text = self.productCategory.name;
     self.descriptionLabel.text = self.productCategory.categoryDescription;
     [self.coverImage sd_setImageWithURL:self.productCategory.cover];
  }];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        self.coverImage.userInteractionEnabled = YES;
    }
    return self;
}
@end
