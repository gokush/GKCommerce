//
//  FeatureCarouselTableViewCell.h
//  WKCommerce
//
//  Created by 小悟空 on 14-10-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeatureTableViewCell.h"
#import "GKCarouselView.h"
#import "FeatureViewModel.h"

@interface FeatureCarouselTableViewCell : FeatureTableViewCell
<GKCarouselViewDelegate>

@property (strong, nonatomic) NSArray *carousels;
@property (strong, nonatomic) IBOutlet GKCarouselView *carouselView;
@end
