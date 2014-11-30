//
//  CartEmptyView.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-2.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CartEmptyView.h"

@implementation CartEmptyView

- (IBAction)didTapShopping:(id)sender
{
    if (!self.authenticated) {
        if ([self.delegate respondsToSelector:@selector(didTapAuthenticate)]) {
            [self.delegate didTapAuthenticate];
        }
    } else{
        if ([self.delegate respondsToSelector:@selector(didTapShopping)]) {
            [self.delegate didTapShopping];
        }
    }
}

- (void)setAuthenticated:(BOOL)authenticated
{
    _authenticated = authenticated;
    if (!_authenticated) {
        self.titleLabel.text = @"购物车还是空的 快去登录挑几件商品吧";
        [self.actionButton setTitle:@"登录" forState:UIControlStateNormal];
    } else {
        self.titleLabel.text = @"购物车还是空的 去挑几件商品吧";
        [self.actionButton setTitle:@"开始购物" forState:UIControlStateNormal];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
