//
//  GKMineViewController.m
//  GKUserKitExample
//
//  Created by 小悟空 on 3/1/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKMineViewController.h"
#import "GKUserAuthenticationController.h"
#import <Objection/Objection.h>
#import "GKRegistrationController.h"

@interface GKMineViewController ()

@end

@implementation GKMineViewController

- (void)setup
{
    self.hud = [[MBProgressHUD alloc] initWithView:self.view];
    self.hud.mode = MBProgressHUDModeCustomView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
    GKUserAuthenticationController *authentication;
    authentication = [[GKUserAuthenticationController alloc] init];
    authentication.authenticateDidSucceed =
        ^(GKUserAuthenticationController *controller, GKUser *user) {
            self.hud.labelText = @"登录成功";
            [self.view addSubview:self.hud];
            [self.hud show:YES];
            [self.hud hide:YES afterDelay:2];
    };
    [self.navigationController pushViewController:authentication animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
