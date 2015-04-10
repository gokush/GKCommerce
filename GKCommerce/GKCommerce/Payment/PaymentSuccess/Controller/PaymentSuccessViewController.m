//
//  PaymentSuccessViewController.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-26.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "PaymentSuccessViewController.h"
#import "OrderDetailViewController.h"


@interface PaymentSuccessViewController ()

@end

@implementation PaymentSuccessViewController

- (id)initWithOrder:(Order *)order andUser:(GKUser *)user
{
    self = [self initWithNibName:@"PaymentSuccessView" bundle:nil];
    if (self) {
        self.order = order;
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"支付结果";
    
    [self fillData];
    
    for (UIView *child in self.view.subviews) {
        if ([@"gotoOrder" isEqualToString:child.restorationIdentifier] ||
            [@"gotoHome" isEqualToString:child.restorationIdentifier]) {
            child.layer.cornerRadius = 4.0f;
        }
    }
}

- (void)setOrder:(Order *)order
{
    _order = order;
    [self fillData];
}

- (void)fillData
{
    self.descriptionOrderSN.text = [NSString
        stringWithFormat:@"恭喜您，订单%@支付成功！", self.order.SN];
    self.descriptionOrderSN.textAlignment = NSTextAlignmentCenter;
    
    self.descriptionOrderPrice.text = [NSString
        stringWithFormat:@"￥%@", self.order.totalPrice];

    
}

- (IBAction)gotoOrderDidTap:(id)sender
{
    OrderDetailViewController *controller;
    controller = [[OrderDetailViewController alloc]
                  initWithOrderID:self.order.orderID
                  andUser:self.user];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)gotoHomeDidTap:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
