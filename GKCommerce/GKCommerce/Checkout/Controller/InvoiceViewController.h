//
//  InvoiceViewController.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/4.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cart.h"

@interface InvoiceViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) Cart *cart;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (id)initWithCart:(Cart *)cart;
- (IBAction)didTapConfirm:(id)sender;
@end
