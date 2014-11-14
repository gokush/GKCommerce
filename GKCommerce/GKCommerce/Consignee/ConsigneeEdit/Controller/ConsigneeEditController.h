//
//  ConsigneeEditController.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConsigneeBackend.h"
#import "AreaPickerViewController.h"

@interface ConsigneeEditController : UIViewController
<UITableViewDataSource, UITableViewDelegate, ConsigneeBackendDelegate,
AreaPickerViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ConsigneeBackend *backend;
@property (strong, nonatomic) NSArray *areas;
@property (strong, nonatomic) AreaPickerViewController *areaPicker;
@end
