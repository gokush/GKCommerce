//
//  ConsigneeListController.h
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Consignee.h"

@interface ConsigneeListController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) User *user;
@property (strong, nonatomic) NSArray *consignees;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (id)initWithConsignees:(NSArray *)consignees;
- (id)initWithUser:(User *)user;
+ (instancetype)consigneeListControllerWithMock;
@end
