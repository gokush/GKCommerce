//
//  PaymentFailureViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-25.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"
#import "GKUser.h"

@interface PaymentFailureViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *message;
@property (strong, nonatomic) IBOutlet UIButton *gotoOrder;
@property (strong, nonatomic) IBOutlet UIButton *gotoHome;
@property (strong, nonatomic) Order *order;
@property (strong, nonatomic) GKUser *user;
- (id)initWithOrder:(Order *)order andUser:(GKUser *)user;
- (IBAction)gotoOrderDidTap:(id)sender;
- (IBAction)gotoHomeDidTap:(id)sender;
@end
