//
//  OrderListController.h
//  GKCommerce
//
//  Created by 小悟空 on 3/11/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKOrderListController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
//@property (strong, nonatomic) 
@end
