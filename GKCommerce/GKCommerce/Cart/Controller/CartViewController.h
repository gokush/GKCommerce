//
//  CartViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-7-29.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cart.h"
#import "CartItemTableViewCell.h"
#import "CartItemOverviewTableViewCell.h"
#import "CartEmptyView.h"
#import "CartService.h"
#import "GKButton.h"

@interface CartViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, CartServiceDelegate,
CartItemTableViewCellDelegate, CartEmptyViewDelegate>

@property (nonatomic, strong) id<CartService> service;
@property (nonatomic, strong) Cart *cart;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UILabel *totalPrice;
@property (nonatomic, strong) IBOutlet GKToggleButton *selectAll;

- (IBAction)checkoutDidTap:(id)sender;
- (IBAction)didSelectAll:(id)sender;
@end
