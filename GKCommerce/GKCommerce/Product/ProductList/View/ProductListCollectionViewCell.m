//
//  ProductIndexViewCell.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-26.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductListCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation ProductListCollectionViewCell

- (void)setProduct:(Product *)product
{
    if (_product != product) {
        _product = product;
        [self renderProduct];
    }
}

- (void)renderProduct
{
    [self.photoImageView sd_setImageWithURL:
     [NSURL URLWithString:self.product.image.small]];
    self.backgroundColor = [UIColor whiteColor];
    self.nameLabel.text = self.product.name;
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f",
                            self.product.price.floatValue];
    self.marketPriceLabel.text = [NSString stringWithFormat:@"%.2f",
                                  self.product.marketPrice.floatValue];
    [self.marketPriceLabel setStrikethrough];
}
@end
