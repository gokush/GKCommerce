//
//  ProductDetailMoreTab.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-14.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductDetailMoreTab.h"

@interface ProductDetailMoreTab()
{
    NSMutableArray *buttons;
    UIView *indicator;
}

@end

@implementation ProductDetailMoreTab

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.titles = @[@"商品介绍", @"规格参数"];
    buttons = [[NSMutableArray alloc] initWithCapacity:self.titles.count];
    ProductDetailMoreTabButton *button;
    NSInteger i = 0;
    for (NSString *title in self.titles) {
        button = [[ProductDetailMoreTabButton alloc]
                  initWithTitle:title atIndex:i];
        button.delegate = self;
        
        if (0 == i)
            [button active];
        else
            [button deactive];
        if (i < self.titles.count - 1)
            [button showRightBorder];
        
        i += 1;
        [buttons addObject:button];
        [self addSubview:button];
    }
    self.backgroundColor = [UIColor colorWithRed:245.0f/255.0f
                                           green:245.0f/255.0f
                                            blue:245.0f/255.0f
                                           alpha:1.0f];
    
    indicator = [[UIView alloc]
                 initWithFrame:CGRectMake(20.0f, 39.0f, 120.0f, 3.0f)];
    indicator.backgroundColor = [UIColor colorWithRed:0.0f/255.0f
                                                green:118.0f/255.0f
                                                 blue:255.0f/255.0f
                                                alpha:1.0f];
    [self addSubview:indicator];
}

- (void)didTapTabButton:(ProductDetailMoreTabButton *)button
{
    if (self.index == button.index)
        return;
    
    [button active];
    
    ProductDetailMoreTabButton *deactiveButton;
    
    for (int i = 0; i < buttons.count; i++) {
        deactiveButton = (ProductDetailMoreTabButton *)
        [buttons objectAtIndex:i];
        if (deactiveButton.index != button.index) {
            [deactiveButton deactive];
        }
    }
    self.index = button.index;
    
    [UIView animateWithDuration:0.2 animations:^{
        CGFloat x = (button.index * button.frame.size.width) + 20.0f;
        CGRect indicatorFrame = indicator.frame;
        indicatorFrame.origin.x = x;
        indicator.frame = indicatorFrame;
    }];
    
    SEL selector = @selector(productDetailMoreTab:didSelectTap:atIndex:);
    if ([self.delegate respondsToSelector:selector]) {
        [self.delegate productDetailMoreTab:self didSelectTap:button.label.text
                                    atIndex:self.index];
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
