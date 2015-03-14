//
//  GKSegmentDelegate.h
//  GKCommerce
//
//  Created by 小悟空 on 3/12/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GKSegmentView;
@protocol GKSegmentViewDelegate <NSObject>

- (NSInteger)numberOfSegments;
- (NSString *)segmentView:(GKSegmentView *)segmentView
titleForSegmentAtIndex:(NSInteger)index;

- (void)segmentView:(GKSegmentView *)segmentView
didSelectAtIndex:(NSInteger)index;
@end
