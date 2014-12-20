//
//  MineOrderDetailViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-20.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Order.h"

@interface OrderDetailViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) Backend *api;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) Order *order;
@property (assign, nonatomic) NSInteger orderID;
@property (strong, nonatomic) NSArray *config;
@property (strong, nonatomic) NSArray *statusConfig;
@property (strong, nonatomic) NSDictionary *JSON;

- (id)initWithOrderID:(NSInteger)orderID andUser:(User *)user;
@end
