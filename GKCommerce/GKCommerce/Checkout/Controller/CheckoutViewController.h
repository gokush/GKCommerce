//
//  CheckoutViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-23.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKUser.h"
#import "Cart.h"
#import "Order.h"
#import "CheckoutProductTableViewCell.h"
#import "GKAddress.h"
#import "GKCheckoutService.h"

@interface CheckoutViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate,
CheckoutProductTableViewCellDelegate>

- (id)initWithUser:(GKUser *)user cart:(Cart *)cart;

@property (strong, nonatomic) GKUser *user;
@property (strong, nonatomic) Cart *cart;
@property (strong, nonatomic) Order *order;
@property (strong, nonatomic) GKAddress *address;
@property (assign, nonatomic) PaymentType paymentType;
@property (strong, nonatomic) NSArray *cartItems;
@property (assign, nonatomic) BOOL isChangeable;
@property (strong, nonatomic) id<GKCheckoutService> service;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *totalPrice;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *freight;
@property (strong, nonatomic) UITextField *focusTextField;

- (IBAction)checkoutDidTap:(id)sender;
@end
