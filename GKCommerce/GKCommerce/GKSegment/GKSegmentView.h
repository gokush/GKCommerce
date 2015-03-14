//
//  GKSegment.h
//  GKCommerce
//
//  Created by 小悟空 on 3/12/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKSegmentViewDelegate.h"

@interface GKSegmentView : UIView

@property (strong, nonatomic) UIColor *indicatorColor;
@property (assign, nonatomic) float indicatorHeight;
@property (strong, nonatomic) UIColor *normalColor;
@property (strong, nonatomic) UIColor *highlightColor;
@property (assign, nonatomic) NSInteger selectedIndex;
@property (strong, nonatomic) IBOutlet id<GKSegmentViewDelegate> delegate;

- (void)reloadData;
@end
