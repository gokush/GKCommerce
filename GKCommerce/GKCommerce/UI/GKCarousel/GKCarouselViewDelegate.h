//
//  WKSlideDelegate.h
//  WuKongCommerce
//
//  Created by 小悟空 on 14-9-10.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKCarouselView.h"
#import "GKCarouselViewCell.h"

@class GKCarouselView;
@protocol GKCarouselViewDelegate <NSObject>

- (GKCarouselViewCell *)carouselView:(GKCarouselView *)carouselView
                         cellAtIndex:(NSInteger)index;
- (NSInteger)numberOfCellsInCarouselView:(GKCarouselView *)carouselView;
@optional
- (void)carouselView:(GKCarouselView *)carouselView
    didSelectAtIndex:(NSInteger)index;

@end
