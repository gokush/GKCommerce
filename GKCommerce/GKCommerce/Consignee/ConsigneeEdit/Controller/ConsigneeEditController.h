//
//  ConsigneeEditController.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConsigneeService.h"
#import "RegionPickerViewController.h"

@interface ConsigneeEditController : UIViewController
<UITableViewDataSource, UITableViewDelegate, ConsigneeServiceDelegate,
RegionPickerViewControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) id<ConsigneeService> service;
@property (strong, nonatomic) NSArray *areas;
@property (strong, nonatomic) RegionPickerViewController *areaPicker;
@property (strong, nonatomic) Address *consignee;
@property (strong, nonatomic) User *user;

- (id)initWithConsignee:(Address *)consignee user:(User *)anUser;
@end
