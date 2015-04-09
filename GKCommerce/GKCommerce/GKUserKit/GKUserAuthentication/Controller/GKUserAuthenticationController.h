//
//  UserauthenticationViewController.h
//  GKCommerce
//
//  Created by 小悟空 on 11/18/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "GKUserAuthenticationTableViewCell.h"
#import "GKUserAuthentication.h"
#import "GKUserService.h"
#import "GKHUD.h"

@interface GKUserAuthenticationController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) id<GKUserService> service;
@property (strong, nonatomic) GKUserAuthentication *user;
@property (strong, nonatomic) UIAlertView *alertView;
/// MBProgressHUD的实例
///
/// 单元测试 mock hud 可以检查认证是否被触发
@property (strong, nonatomic) GKHUD *hud;
/// 认证成功
/// @param controller 用户认证控制器
/// @param user 用户
@property (copy, nonatomic)
void (^authenticateDidSucceed)(GKUserAuthenticationController *controller,
                               GKUser *user);

/// 认证失败
/// @param error 失败信息
@property (copy, nonatomic) void (^authenticateDidFail)(NSError *error);

/// 认证
- (IBAction)authenticate:(id)sender;
- (IBAction)forgotPasswordDidTap:(id)sender;
- (IBAction)registrationDidTap:(id)sender;
@end
