//
//  PaymentFailureViewController.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-9-25.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "PaymentFailureViewController.h"
#import "OrderDetailViewController.h"

@interface PaymentFailureViewController ()

@end

@implementation PaymentFailureViewController

- (id)initWithOrder:(Order *)order andUser:(User *)user
{
    self = [self initWithNibName:@"PaymentFailureView" bundle:nil];
    if (self) {
        self.order = order;
        self.user = user;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.gotoHome.layer.cornerRadius = 3.0f;
    self.gotoOrder.layer.cornerRadius = 3.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)gotoOrderDidTap:(id)sender
{
    OrderDetailViewController *viewController;
    viewController = [[OrderDetailViewController alloc]
                      initWithOrderID:self.order.orderID
                      andUser:self.user];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)gotoHomeDidTap:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
