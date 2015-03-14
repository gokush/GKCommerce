//
//  GKSegment.m
//  GKCommerce
//
//  Created by 小悟空 on 3/12/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKSegmentView.h"

@interface GKSegmentView()

@property (strong, nonatomic) UIView *indicatorView;
@property (assign, nonatomic) NSInteger numberOfSegments;
@property (strong, nonatomic) NSMutableArray *segments;
@end

@implementation GKSegmentView

- (id)init
{
    self = [super init];
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
    self.indicatorColor = self.tintColor;
    self.indicatorHeight = 3.0f;
    self.normalColor = [UIColor colorWithRed:83/255.0  green:83/255.0
                                          blue:83/255.0  alpha:1];
    self.highlightColor = self.tintColor;
}

- (void)reloadData
{
    NSInteger numberOfSegments;
    if ([self.delegate respondsToSelector:@selector(numberOfSegments)])
        self.numberOfSegments = numberOfSegments =
            [self.delegate numberOfSegments];
    
    float indicatorWidth = self.frame.size.width / numberOfSegments;
    
    for (UIView *child in self.subviews)
        if ([child isKindOfClass:[UIButton class]])
            [child removeFromSuperview];
    
    self.segments = [NSMutableArray array];
    
    for (int i = 0; i < numberOfSegments; i++) {
        UIButton *segmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [segmentButton setTitleColor:self.normalColor
                            forState:UIControlStateNormal];
        segmentButton.frame = CGRectMake(i * indicatorWidth, 0.0f,
                                         indicatorWidth,
                                         self.frame.size.height);
        NSString *title;
        SEL titleSelector = @selector(segmentView:titleForSegmentAtIndex:);
        if ([self.delegate respondsToSelector:titleSelector]) {
            title = [self.delegate segmentView:self titleForSegmentAtIndex:i];
            [segmentButton setTitle:title forState:UIControlStateNormal];
        }
        
        [segmentButton setTitleColor:self.normalColor
                            forState:UIControlStateNormal];
        
        
        if (0 == i) {
            [segmentButton setTitleColor:self.highlightColor
                                forState:UIControlStateNormal];
            segmentButton.highlighted = YES;
        }
        
        [segmentButton addTarget:self action:@selector(segmentButtonDidTap:)
                forControlEvents:UIControlEventTouchUpInside];
        [segmentButton setContentVerticalAlignment:
         UIControlContentVerticalAlignmentCenter];
        [segmentButton setContentHorizontalAlignment:
         UIControlContentHorizontalAlignmentCenter];
//        segmentButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        segmentButton.tag = i;
        [self addSubview:segmentButton];
        NSLog(@"%f", self.frame.size.height);
        [self.segments addObject:segmentButton];
    }
    
    if (nil == self.indicatorView) {
        CGRect frame;
        frame = CGRectMake(0.0f, self.frame.size.height - self.indicatorHeight,
                           indicatorWidth, self.indicatorHeight);
        self.indicatorView = [[UIView alloc] initWithFrame:frame];
        self.indicatorView.backgroundColor = self.indicatorColor;
    } else {
        [self.indicatorView removeFromSuperview];
    }
    [self addSubview:self.indicatorView];
}

- (void)segmentButtonDidTap:(id)sender
{
    UIButton *segmentButton = (UIButton *)sender;
    self.selectedIndex = segmentButton.tag;
    [self changeSelectedIndex:self.selectedIndex];
    SEL selector = @selector(segmentView:didSelectAtIndex:);
    if ([self.delegate respondsToSelector:selector]) {
        [self.delegate segmentView:self didSelectAtIndex:self.selectedIndex];
    }
}

- (void)changeSelectedIndex:(NSInteger)index
{
    float indicatorWidth = self.frame.size.width / self.numberOfSegments;
    
    for (NSInteger i = 0, size = self.numberOfSegments; i < size; i++) {
        UIButton *button = (UIButton *)[self.segments objectAtIndex:i];
        if (i == index) {
            [button setTitleColor:self.highlightColor
                         forState:UIControlStateNormal];
            [UIView
             animateWithDuration:0.2 delay:0
             options:UIViewAnimationOptionCurveEaseInOut
             animations:^{
                 self.indicatorView.frame = CGRectMake(i * indicatorWidth, 38,
                                                       85, 3);
             } completion:^(BOOL finished) {
             }];
            
        } else {
            [button setTitleColor:self.normalColor
                         forState:UIControlStateNormal];
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
