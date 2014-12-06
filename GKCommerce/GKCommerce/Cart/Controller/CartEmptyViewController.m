//
//  CartEmptyViewController.m
//  GKCommerce
//
//  Created by 小悟空 on 12/6/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "CartEmptyViewController.h"

@interface CartEmptyViewController ()

@end

@implementation CartEmptyViewController

- (id)init
{
    self = [self initWithNibName:@"CartEmptyView" bundle:nil];
    if (self) {
        [RACObserve(self, authenticated) subscribeNext:^(id x) {
            if (!_authenticated) {
                self.titleLabel.text = @"购物车还是空的 快去登录挑几件商品吧";
                [self.actionButton setTitle:@"登录"
                                   forState:UIControlStateNormal];
            } else {
                self.titleLabel.text = @"购物车还是空的 去挑几件商品吧";
                [self.actionButton setTitle:@"开始购物"
                                   forState:UIControlStateNormal];
            }
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (instancetype)shared
{
    static CartEmptyViewController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CartEmptyViewController alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
