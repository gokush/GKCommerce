//
//  CheckoutProductTableViewCell.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-23.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CheckoutProductTableViewCell.h"
#import <SDWebImage/UIButton+WebCache.h>
#import<CoreText/CoreText.h>

@implementation CheckoutProductTableViewCell

- (void)awakeFromNib
{
    @weakify(self);
    [[RACObserve(self, item) filter:^BOOL(id value) {
        return nil == value ? NO : YES;
     }]
     subscribeNext:^(id x) {
        @strongify(self);
        [self render];
    }];
    
    self.productPhotoButton.rac_command =
    [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        static SEL selector;
        selector = @selector(checkoutProductTableViewCell:didTapProduct:);
        if ([self.delegate respondsToSelector:selector])
            [self.delegate checkoutProductTableViewCell:self
                                          didTapProduct:self.item.product];
        return [RACSignal empty];
    }];
}

- (void)render
{
    NSURL *photoURL;;
    NSString *qty, *price;
    
    photoURL = [[NSURL alloc] initWithString:self.item.product.image.small];
    qty = [NSString stringWithFormat:@"x%d", self.item.quantity];
    price = [NSString stringWithFormat:@"￥%@", self.item.product.listingPrice];
    
    [self.productPhotoButton sd_setBackgroundImageWithURL:photoURL
                                                 forState:UIControlStateNormal];
    self.nameLabel.text = self.item.product.name;
    self.shopPriceLabel.text = price;
}
@end
