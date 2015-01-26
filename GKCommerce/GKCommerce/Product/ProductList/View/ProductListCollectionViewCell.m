//
//  ProductIndexViewCell.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-26.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductListCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "NSString+GKResizable.h"

@implementation ProductListCollectionViewCell

- (void)awakeFromNib
{
  [super awakeFromNib];
  @weakify(self);
  [RACObserve(self, product) subscribeNext:^(Product *product) {
    @strongify(self);
    [self renderProduct];
  }];
}

- (void)renderProduct
{
  RACSignal *signal =
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    UIImage *image = [[[self.product.pictures.firstObject GKRSetWidth:148.0f]
                      height: 148.0f] image];
    [subscriber sendNext:image];
    [subscriber sendCompleted];
    return [RACDisposable disposableWithBlock:^{
    }];
  }];
  
  RAC(self.photoImageView, image) = signal;
  
  self.backgroundColor = [UIColor whiteColor];
  self.nameLabel.text = self.product.name;
  self.priceLabel.text = [NSString stringWithFormat:@"%.2f",
                          self.product.listingPrice.floatValue];
  self.marketPriceLabel.text = [NSString stringWithFormat:@"%.2f",
                                self.product.regularPrice.floatValue];
  [self.marketPriceLabel setStrikethrough];
}
@end
