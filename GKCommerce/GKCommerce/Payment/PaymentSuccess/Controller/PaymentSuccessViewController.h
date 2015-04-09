//
//  PaymentSuccessViewController.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-26.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"
#import "GKUser.h"

@interface PaymentSuccessViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *descriptionOrderSN;
@property (strong, nonatomic) IBOutlet UILabel *descriptionOrderPrice;
@property (strong, nonatomic) Order *order;
@property (strong, nonatomic) GKUser *user;

- (id)initWithOrder:(Order *)order andUser:(User *)user;
- (IBAction)gotoOrderDidTap:(id)sender;
- (IBAction)gotoHomeDidTap:(id)sender;

@end
