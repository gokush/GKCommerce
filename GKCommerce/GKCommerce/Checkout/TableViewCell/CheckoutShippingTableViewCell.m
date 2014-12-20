//
//  CheckoutShippingTableViewCell.m
//  GKCommerce
//
//  Created by goku on 14/11/1.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "CheckoutShippingTableViewCell.h"

@implementation CheckoutShippingTableViewCell

- (void)awakeFromNib {
    @weakify(self);
    [RACObserve(self, cart) subscribeNext:^(Cart *cart) {
        @strongify(self);
        
        self.nameLabel.text = self.cart.shipping.name;
        self.freightLabel.text = [[NSString alloc] initWithFormat:@"%.2f",
                                  self.cart.shipping.freight.floatValue];
    }];
    
    UITapGestureRecognizer *tapGesture;
    tapGesture = [[UITapGestureRecognizer alloc]
                  initWithTarget:self action:@selector(didTapCell:)];
    [self addGestureRecognizer:tapGesture];
}

- (void)didTapCell:(id)sender
{
    SEL selector = @selector(didSelectCheckoutShippingTableViewCell:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate didSelectCheckoutShippingTableViewCell:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bind
{
}

- (void)unbind
{
}
@end
