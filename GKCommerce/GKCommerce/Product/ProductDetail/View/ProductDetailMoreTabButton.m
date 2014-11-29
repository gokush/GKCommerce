//
//  ProductDetailMoreTabButton.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-15.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductDetailMoreTabButton.h"
#import <QuartzCore/QuartzCore.h>
@implementation ProductDetailMoreTabButton

- (id)initWithTitle:(NSString *)title atIndex:(NSInteger)index
{
    self = [self initWithFrame:CGRectMake(160.0f * index, 0.0f, 160.f, 40.0f)];
    if (self) {
        self.index = index;
        self.text = title;
        self.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor clearColor];
        
        if ([self.delegate respondsToSelector:@selector(didTabButtonTap:)]) {
            [self.delegate didTapTabButton:self];
        }
        
        UITapGestureRecognizer *recognizer;
        recognizer = [[UITapGestureRecognizer alloc]
                      initWithTarget:self action:@selector(didTapGesture:)];
        [self addGestureRecognizer:recognizer];
        self.userInteractionEnabled = YES;
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 41.0f, self.frame.size.width, 1.0f);
        layer.backgroundColor = [UIColor colorWithRed:211.0f/255.0f
                                                green:211.0f/255.0f
                                                 blue:211.0f/255.0f
                                                alpha:1.0].CGColor;
        [self.layer addSublayer:layer];
    }
    return self;
}

- (void)showRightBorder
{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(159.0f, 13.0f, 1.0f, 16.0f);
    layer.backgroundColor = [UIColor colorWithRed:211.0f/255.0f
                                            green:211.0f/255.0f
                                             blue:211.0f/255.0f
                                            alpha:1.0].CGColor;
    [self.layer addSublayer:layer];
}

- (void)active
{
    self.textColor = [UIColor colorWithRed:0.0f/255.0f
                                     green:118.0f/255.0f
                                      blue:255.0f/255.0f
                                     alpha:1.0f];
}

- (void)deactive
{
    self.textColor = [UIColor colorWithRed:102.0f/255.0f
                                     green:102.0f/255.0f
                                      blue:102.0f/255.0f
                                     alpha:1.0f];
}

- (void)didTapGesture:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(didTabButtonTap:)]) {
        [self.delegate didTapTabButton:self];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
