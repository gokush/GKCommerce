//
//  CheckoutView.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-23.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CheckoutView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CheckoutView

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
    self.topBorderColor = [UIColor colorWithRed:213.0f/255.0f
                                          green:213.0f/255.0f
                                           blue:213.0f/255.0f
                                          alpha:1.0f];
    
    for (UIView *child in self.subviews) {
        if ([@"overview" isEqualToString:child.restorationIdentifier]) {
            CALayer *topBorder = [CALayer layer];
            topBorder.frame = CGRectMake(0.0f, 0.0f, self.frame.size.width,
                                         1.0f);
            topBorder.backgroundColor = self.topBorderColor.CGColor;
            [child.layer addSublayer:topBorder];
            
            for (UIView *subchild in child.subviews) {
                if ([@"checkout_button"
                     isEqualToString:subchild.restorationIdentifier]) {
                    
                    subchild.layer.cornerRadius = 5.0f;
                }
            }
        }
    }
}
@end
