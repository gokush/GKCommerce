//
//  GKForgotPasswordController.h
//  GKUserKitExample
//
//  Created by MASGG on 15-2-22.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKForgotPasswordController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
