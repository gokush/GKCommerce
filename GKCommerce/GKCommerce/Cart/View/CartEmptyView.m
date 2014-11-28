//
//  CartEmptyView.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-2.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CartEmptyView.h"

@implementation CartEmptyView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    for (UIView *child in self.subviews) {
        if ([@"shopping" isEqualToString:child.restorationIdentifier]) {
            UIButton *shopping = (UIButton *)child;
            shopping.layer.cornerRadius = 3.0f;
            [shopping addTarget:self
                         action:@selector(shoppingDidTap:)
               forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)shoppingDidTap:(id)sender
{
    if (!self.hasLogin) {
        if ([self.delegate respondsToSelector:@selector(loginDidTap)]) {
            [self.delegate loginDidTap];
        }
    }
    else{
        if ([self.delegate respondsToSelector:@selector(shoppingDidTap)]) {
            [self.delegate shoppingDidTap];
        }
    }
}

- (void) setHasLogin:(BOOL)hasLogin
{
    _hasLogin = hasLogin;
    UILabel *label = (UILabel*)[self viewWithTag:10];
    UIButton *button = (UIButton*)[self viewWithTag:20];
    if (!_hasLogin) {
        label.text = @"购物车还是空的 快去登录挑几件商品吧";
        [button setTitle:@"登录" forState:UIControlStateNormal];
    }
    else{
        label.text = @"购物车还是空的 去挑几件商品吧";
        if (self.buttonString == nil) {
            [button setTitle:@"开始购物" forState:UIControlStateNormal];
        }
        else{
            [button setTitle:self.buttonString forState:UIControlStateNormal];
        }
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
