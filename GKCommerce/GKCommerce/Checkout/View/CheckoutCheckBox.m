//
//  CheckoutCheckBox.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-24.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CheckoutCheckBox.h"

@implementation CheckoutCheckBox

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
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *recognizer;
    recognizer = [[UITapGestureRecognizer alloc]
                  initWithTarget:self
                  action:@selector(checkoutViewDidTap:)];
    
    [self addGestureRecognizer:recognizer];
    
    UIImageView *background;
    UIImage *backgroundImage;
    backgroundImage = [UIImage imageNamed:@"checkout_checkbox.png"];
    background = [[UIImageView alloc] initWithImage:backgroundImage];
    
    [self addSubview:background];
    
    selectedImageView = [[UIImageView alloc]
                         initWithImage:[UIImage imageNamed:
                                        @"checkout_checkbox_checked"]];
}

- (void)setSelected:(BOOL)selected
{
    if (selected == _selected)
        return;
    
    if (_selected) {
        [selectedImageView removeFromSuperview];
    } else {
        [self addSubview:selectedImageView];
    }
    _selected = selected;
    
    if ([self.delegate
         respondsToSelector:@selector(checkoutCheckBox:didChecked:)])
        [self.delegate checkoutCheckBox:self didChecked:_selected];
}

- (void)checkoutViewDidTap:(id)sender
{
    
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
