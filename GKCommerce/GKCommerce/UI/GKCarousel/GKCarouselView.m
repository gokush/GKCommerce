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
#import <Masonry/Masonry.h>


@interface UIScrollViewChildrenTouchable : UIScrollView

@end

@implementation UIScrollViewChildrenTouchable

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    if (!self.dragging) {
        [self.nextResponder touchesBegan:touches withEvent:event];
    }
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.dragging) {
        [self.nextResponder touchesEnded:touches withEvent:event];
    }
    [super touchesEnded:touches withEvent:event];
}

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event
             inContentView:(UIView *)view
{
    return YES;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    return NO;
}

@end

@interface CarouselContentView : UIView

@end

@implementation CarouselContentView
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    [super touchesBegan:touches withEvent:event];
}
@end

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
    
    self.scrollView = [[UIScrollViewChildrenTouchable alloc]
                       initWithFrame:self.frame];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.alwaysBounceHorizontal = YES;
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.bounces = YES;
    self.scrollView.directionalLockEnabled = YES;
    self.scrollView.bouncesZoom = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.canCancelContentTouches = YES;
    self.scrollView.delaysContentTouches = NO;
    self.scrollView.userInteractionEnabled = YES;
    self.autoSlide = 5.0f;
    
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    self.contentView = [[CarouselContentView alloc] init];
    self.contentView.userInteractionEnabled = self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *touch;
    touch = [[UITapGestureRecognizer alloc]
             initWithTarget:self action:@selector(cellDidSelect:)];
    touch.cancelsTouchesInView = NO;
    [self.scrollView addGestureRecognizer:touch];
    [self.scrollView addSubview:self.contentView];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
    }];
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
    
    GKCarouselViewCell *cell, *last;
    
    
    
    cells = [NSMutableArray new];
    for (int i = 0; i < numberOfCells; i++) {
        cell = [self.delegate carouselView:self cellAtIndex:i];
        cell.userInteractionEnabled = YES;
        cell.tag = i;
        [self.contentView addSubview:cell];

        [cell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.scrollView.mas_width);
            make.height.equalTo(self.scrollView.mas_height);
            
            make.leading.equalTo(last ? last.mas_trailing :
                                        self.contentView.mas_leading);
            make.top.equalTo(self.contentView.mas_top);
            
        }];
        last = cell;
        [cells addObject:cell];
    }
    
    if (last) {
        [last mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.contentView);
        }];
    }
    self.scrollView.contentOffset = CGPointMake(0.0f, 0.0f);
    
    self.pageControl.numberOfPages = numberOfCells;
    self.pageControl.currentPage = 0;
    
    if (timer)
        [timer invalidate];
    timer = [NSTimer
             scheduledTimerWithTimeInterval:self.autoSlide target:self
             selector:@selector(carouselInterval:) userInfo:nil repeats:YES];
}

- (void)carouselInterval:(id)sender
{
    NSInteger nextPage = self.pageControl.currentPage + 1;
    if (nextPage >= numberOfCells)
        nextPage = 0;
    self.pageControl.currentPage = nextPage;
    GKCarouselViewCell *next = cells[nextPage];

    [self.scrollView setContentOffset:next.frame.origin animated:YES];
}

- (void)cellDidSelect:(UITapGestureRecognizer *)recognizer
{
    SEL selector = @selector(carouselView:didSelectAtIndex:);
    if ([self.delegate respondsToSelector:selector]) {
        [self.delegate carouselView:self
                   didSelectAtIndex:self.pageControl.currentPage];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = self.scrollView.contentOffset.x /
    (self.bounds.size.width);
}
@end
