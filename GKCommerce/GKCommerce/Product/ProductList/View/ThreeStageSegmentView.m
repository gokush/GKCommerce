//
//  ThreeStageSegmentView.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-3.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ThreeStageSegmentView.h"

@implementation ThreeStageSegmentView
{
    NSMutableArray *buttons;
    NSArray *indicatorLocations;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.normalColor = [UIColor colorWithRed:83/255.0  green:83/255.0
                                            blue:83/255.0  alpha:1];
        self.highlightColor = [UIColor colorWithRed:0/255.0 green:144/255.0
                                               blue:255/255.0  alpha:1];
        
        self.indicatorView = [[UIView alloc]
                              initWithFrame:CGRectMake(11, 38, 85, 3)];
        self.indicatorView.backgroundColor = self.highlightColor;
        [self addSubview:self.indicatorView];
        
        buttons = [[NSMutableArray alloc] init];
        for (UIView *child in self.subviews) {
            if ([child isKindOfClass:[UIButton class]]) {
                UIButton *button = (UIButton *)child;
                [button addTarget:self action:@selector(didTapButton:)
                 forControlEvents:UIControlEventTouchUpInside];
                [buttons addObject:child];
            }
        }
        [((UIButton *)[buttons objectAtIndex:0]) setHighlighted:NO];
        indicatorLocations = @[@11.0f, @118.0f, @255.0f];
    }
    return  self;
}

- (void)changeSelectedIndex:(NSInteger)index
{
    for (NSInteger i = 0, size = 3; i < size; i++) {
        UIButton *button = (UIButton *)[buttons objectAtIndex:i];
        if (i == index) {
            [button setTitleColor:self.highlightColor
                         forState:UIControlStateNormal];
            [UIView
             animateWithDuration:0.2 delay:0
             options:UIViewAnimationOptionCurveEaseInOut
             animations:^{
                 CGFloat x = [[indicatorLocations objectAtIndex:i] floatValue];
                 self.indicatorView.frame = CGRectMake(x, 38, 85, 3);
             } completion:^(BOOL finished) {
             }];
            
        } else {
            [button setTitleColor:self.normalColor
                         forState:UIControlStateNormal];
        }
    }
    self.selectedIndex = index;
    SEL selector = @selector(threeStageSegmentView:didSelectAtIndex:);
    if ([self.delegate respondsToSelector:selector]) {
        [self.delegate threeStageSegmentView:self didSelectAtIndex:index];
    }
}

- (void)didTapButton:(id)sender
{
    UIButton *button = (UIButton *)sender;
    [self changeSelectedIndex:button.tag];
}
@end
