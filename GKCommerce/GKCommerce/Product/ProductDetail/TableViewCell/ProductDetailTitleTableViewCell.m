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
    [RACObserve(self, product) subscribeNext:^(id x) {
        [self render];
    }];
}

- (void)render
{
    self.title.text = self.product.name;
    self.price.text = [[NSString alloc] initWithFormat:@"￥%.2f",
                       self.product.listingPrice.floatValue];
    self.marketPrice.text = [[NSString alloc] initWithFormat:@"%.2f",
                             self.product.regularPrice.floatValue];
    self.favor.selected = YES;
}
@end
