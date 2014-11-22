//
//  ProductDetailTitleTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 14/10/22.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "ProductDetailTitleTableViewCell.h"

@implementation ProductDetailTitleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)render
{
    self.title.text = self.product.name;
    self.price.text = [[NSString alloc] initWithFormat:@"￥%.2f",
                       self.product.price.floatValue];
    self.marketPrice.text = [[NSString alloc] initWithFormat:@"%.2f",
                             self.product.marketPrice.floatValue];
    self.favor.selected = YES;
}

- (void)bind
{
    [self addObserver:self forKeyPath:@"product"
              options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unbind
{
    [self removeObserver:self forKeyPath:@"product"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    if ([@"product" isEqualToString:keyPath])
        [self render];
}
@end
