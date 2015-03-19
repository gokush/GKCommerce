//
//  WKSlide.m
//  WuKongCommerce
//
//  Created by 小悟空 on 14-9-10.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "GKCarouselView.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIButton+WebCache.h>

@interface GKCarouselView()
{
    NSMutableArray *cells;
    NSTimer *timer;
    NSInteger numberOfCells;
}
@end

@implementation GKCarouselView

- (void)setup
{
    cells = [[NSMutableArray alloc] init];
    self.marginBottom = 5.0f;
    
    CGRect pageControlFrame;
    pageControlFrame = CGRectMake(0.0f, 0.0f, 39.0f, 37.0f);
    pageControlFrame.origin.x = (self.frame.size.width -
                                 pageControlFrame.size.width) / 2;
    pageControlFrame.origin.y = self.frame.size.height -
    pageControlFrame.size.height - self.marginBottom;
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:pageControlFrame];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.alwaysBounceHorizontal = YES;
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.bounces = YES;
    self.scrollView.directionalLockEnabled = YES;
    self.scrollView.bouncesZoom = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor clearColor];
    
    self.backgroundColor = [UIColor clearColor];
    self.autoSlide = 5.0f;
    
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
}

- (void)setPageControlColor:(UIColor *)color
{
    self.pageControl.currentPageIndicatorTintColor = color;
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

- (void)reloadData
{
    if (![self.delegate
          respondsToSelector:@selector(numberOfCellsInCarouselView:)])
        return;
    
    numberOfCells = [self.delegate numberOfCellsInCarouselView:self];
    
    if (0 == numberOfCells)
        return;
    
    GKCarouselViewCell *cell;
    
    UITapGestureRecognizer *recognizer;
    recognizer = [[UITapGestureRecognizer alloc]
                  initWithTarget:self
                  action:@selector(didButtonTap:)];
    CGSize size = self.frame.size;
    for (int i = 0; i < numberOfCells; i++) {
        cell = [self.delegate carouselView:self cellAtIndex:i];
        
        CGRect frame = cell.frame;
        frame.origin.x = i * size.width;
        frame.size.width = size.width;
        frame.size.height = size.height;
        
        cell.frame = frame;
        [self.scrollView addSubview:cell];
    }
    
    self.scrollView.contentSize = CGSizeMake(numberOfCells * size.width,
                                             size.height);
    self.scrollView.contentOffset = CGPointMake(0.0f, 0.0f);
    
    self.pageControl.numberOfPages = numberOfCells;
    self.pageControl.currentPage = 0;
    
    timer = [NSTimer
             scheduledTimerWithTimeInterval:self.autoSlide target:self
             selector:@selector(carouselIinterval:) userInfo:nil repeats:YES];
}

- (void)carouselIinterval:(id)sender
{
    CGPoint target = self.scrollView.contentOffset;
    NSInteger currentPage = self.pageControl.currentPage + 1;
    if (currentPage >= numberOfCells)
        currentPage = -1;
    self.pageControl.currentPage += currentPage;
    target.x = self.pageControl.currentPage * self.frame.size.width;
    [self.scrollView setContentOffset:target animated:YES];
}

- (void)didButtonTap:(UITapGestureRecognizer *)recognizer
{
//    SlideButton *button = (SlideButton *)recognizer.view;
//    if ([self.delegate respondsToSelector:@selector(slide:didTapAtIndex:)]) {
//        [self.delegate slide:self didTapAtIndex:button.index];
//    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = self.scrollView.contentOffset.x /
    (self.bounds.size.width);
}
@end
