//
//  ConsigneeController.h
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Consignee.h"

@interface ConsigneeController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Consignee *consignee;

- (id)initWithConsignee:(Consignee *)consignee;
+ (instancetype)consigneeControllerWithMock;
@end
