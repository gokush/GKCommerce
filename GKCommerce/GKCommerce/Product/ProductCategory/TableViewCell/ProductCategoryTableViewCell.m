//
//  MallCategoryCell.m
//  goku-commerce.com
//
//  Created by wupeng on 8/8/14.
//  Copyright (c) 2014 魏琮举. All rights reserved.
//

#import "ProductCategoryTableViewCell.h"
#import <UIImageView+WebCache.h>

@implementation ProductCategoryTableViewCell
- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"productCategory"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        self.coverImage.userInteractionEnabled = YES;
        [self addObserver:self
               forKeyPath:@"productCategory"
                  options:NSKeyValueObservingOptionInitial
                  context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([@"productCategory" isEqualToString:keyPath])
        [self renderProductCategory];
}

- (void)renderProductCategory
{
    self.nameLabel.text = self.productCategory.name;
    self.descriptionLabel.text = self.productCategory.categoryDescription;
    [self.coverImage sd_setImageWithURL:self.productCategory.cover];
}
@end
