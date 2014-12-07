//
//  GKQuantityView.m
//  GKCommerce
//
//  Created by 小悟空 on 12/7/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "GKQuantityView.h"

@implementation GKQuantityView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIColor *borderColor = UIColorFromRGB(0xb8b8b8);
        UIView *child;
        for (child in self.subviews)
            if ([child isKindOfClass:[UITextField class]])
                self.quantityTextField = (UITextField *)child;
        
        SeparatorOption *option;
        option = [SeparatorOption
                  optionWithColor:borderColor
                  onDirection:SeparatorDirectionLeft|SeparatorDirectionRight];
        [self.quantityTextField setSeparatorWithOption:option];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
