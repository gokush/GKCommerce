//
//  ThreeStageSegmentView.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-3.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ThreeStageSegmentView;

@protocol ThreeStageSegmentViewDelegate <NSObject>
- (void)threeStageSegmentView:(ThreeStageSegmentView *)segment
             didSelectAtIndex:(NSInteger)index;
@end

@interface ThreeStageSegmentView : GKView

@property (strong, nonatomic) UIView *indicatorView;
@property (strong, nonatomic) UIColor *normalColor;
@property (strong, nonatomic) UIColor *highlightColor;
@property (strong, nonatomic) IBOutlet UIButton *newsButton;
@property (strong, nonatomic) IBOutlet UIButton *lowButton;
@property (strong, nonatomic) IBOutlet UIButton *highButton;
@property (strong, nonatomic)
IBOutlet id<ThreeStageSegmentViewDelegate> delegate;
@property (assign, nonatomic) NSInteger selectedIndex;
@end

