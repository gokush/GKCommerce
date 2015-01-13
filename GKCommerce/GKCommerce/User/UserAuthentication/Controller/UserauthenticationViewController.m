//
//  UserauthenticationViewController.m
//  GKCommerce
//
//  Created by 小悟空 on 11/18/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "UserAuthenticationViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "Dependency.h"

typedef enum {
    InputSectionUsernameCell,
    InputSectionPasswordCell
} InputSection;

typedef enum {
    ConfirmSectionCell
} ConfirmSection;

typedef enum {
    InputUserAuthenticationSection,
    ConfirmUserAuthenticationSection
} UserAuthenticationSection;

@interface UserAuthenticationViewController ()

@end

@implementation UserAuthenticationViewController

- (id)init
{
    self = [self initWithNibName:@"UserAuthenticationView" bundle:nil];
    if (self) {
        self.service = [[Dependency shared] userService];
        self.service.delegate = self;
        self.user = [[UserAuthenticationModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (NSString *identifier in @[@"UserAuthenticationTableViewCell"]) {
        UINib *nib;
        nib = [UINib nibWithNibName:identifier bundle:nil];
        [self.tableView registerNib:nib
             forCellReuseIdentifier:identifier];
    }
    
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.96f green:0.96f
                                                      blue:0.96f alpha:1.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case InputUserAuthenticationSection:
            return 2;
            break;
        case ConfirmUserAuthenticationSection:
            return 1;
            break;
        default:
            break;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    switch (indexPath.section) {
        case InputUserAuthenticationSection:
            cell = [self inputCellForRowAtIndexPath:indexPath];
            break;
        case ConfirmUserAuthenticationSection:
            cell = [self confirmCellForRowAtIndexPath:indexPath];
        default:
            break;
    }
    [tableView tableViewCell:cell setSeparatorForRowAtIndexPath:indexPath];
    return cell;
}

- (UITableViewCell *)inputCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserAuthenticationTableViewCell *cell;
    static NSString *name = @"UserAuthenticationTableViewCell";
    cell = [self.tableView dequeueReusableCellWithIdentifier:name];
    
    switch (indexPath.row) {
        case InputSectionUsernameCell: {
            cell.titleLabel.text = @"用户名";
            cell.inputTextField.placeholder = @"请输入用户名";
            break;
        }
        case InputSectionPasswordCell: {
            cell.titleLabel.text = @"密码";
            cell.inputTextField.placeholder = @"请输入密码";
            break;
        }
        default:
            break;
    }
    [cell.inputTextField addTarget:self
                            action:@selector(textFieldDidChange:)
                  forControlEvents:UIControlEventEditingChanged];
    cell.inputTextField.tag = indexPath.row;
    
    return cell;
}

- (UITableViewCell *)confirmCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    static NSString *name = @"UserAuthenticationConfirmTableViewCell";
    cell = [self.tableView dequeueReusableCellWithIdentifier:name];
    if (!cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:name];
        
        cell.textLabel.textColor = [UIColor colorWithRed:0.15f green:0.47f
                                                    blue:1.0f alpha:1.0f];
        cell.textLabel.text = @"登录";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case ConfirmUserAuthenticationSection: {
            NSError *error = [self.user valid];
            if (nil == error) {
                [self.service authenticate:self.user];
                break;
            }
            
            MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
            hud.labelText = [error localizedDescription];
            hud.mode = MBProgressHUDModeCustomView;
            [self.view addSubview:hud];
            [hud show:YES];
            [hud hide:YES afterDelay:2];
            break;
        }
        default:
            break;
    }
}

- (void)textFieldDidChange:(id)sender
{
    UITextField *textField = (UITextField *)sender;
    switch (textField.tag) {
        case InputSectionUsernameCell:
            self.user.username = textField.text;
            break;
        case InputSectionPasswordCell:
            self.user.password = textField.text;
        default:
            break;
    }
}

- (void)userService:(id<UserService>)anUserService didAuthencate:(User *)user
              error:(NSError *)anError
{
    if (nil == anError) {
        [self.view showHUD:@"成功登录" afterDelay:2];
        [self.navigationController popViewControllerAnimated:YES];
    } else
        [self.view showHUD:anError.localizedDescription afterDelay:2];
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
