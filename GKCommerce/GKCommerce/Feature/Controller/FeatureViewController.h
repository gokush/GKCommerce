//
//  DefaultViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-7-29.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeatureService.h"
#import "FeatureViewModel.h"
#import "FeatureTableViewCell.h"

typedef enum {
    FeatureCarouselSection,
    FeatureThreeColumnSection,
    FeatureOneColumnSection
} FeatureSection;

@interface FeatureViewController : UIViewController
<FeatureServiceDelegate, UITableViewDataSource, UITableViewDelegate,
FeatureTableViewCellDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) id<FeatureService> service;
@property (strong, nonatomic) FeatureViewModel *model;
@property (strong, nonatomic) NSArray *searchButton;
@property (strong, nonatomic) NSArray *carousels;
@end
