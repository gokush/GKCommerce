//
//  CartViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-7-29.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cart.h"
#import "CartItemList.h"
#import "CartItemTableViewCell.h"
#import "CartStoreNameTableViewCell.h"
#import "CartItemOverviewTableViewCell.h"
#import "CartEmptyViewController.h"
#import "GKButton.h"
#import "GKCartService.h"

@interface CartViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate,
CartItemTableViewCellDelegate, GKToggleButtonDelegate,
CartStoreNameTableViewCellDelegate>

@property (nonatomic, strong) id<GKCartService> service;
@property (nonatomic, weak) Cart *cart;
@property (nonatomic, weak) GKUser *user;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UILabel *totalPrice;
@property (nonatomic, strong) IBOutlet GKToggleButton *selectAll;

- (IBAction)didTapCheckout:(id)sender;
@end
