//
//  ViewController.m
//  GKUserKitExample
//
//  Created by 宇 陈 on 15/2/21.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "GKRegistrationController.h"
#import "GKRegistrationTableViewCell.h"
#import "GKUserAccessToken.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Objection/Objection.h>


@interface GKRegistrationController ()
@end

@implementation GKRegistrationController
objection_requires(@"service")

- (id)init
{
    self = [self initWithNibName:@"GKRegistrationController" bundle:nil];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (NSString* identifier in @[@"GKRegistrationTableViewCell"]) {
        [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil]
             forCellReuseIdentifier:identifier];
    }
}


- (void)setup
{
//    self.service = [[GKUserContainerMock alloc] userService];
    self.registration = [[GKUserRegistration alloc] init];
    self.hud = [GKHUD defaultHUD];
    
    self.title = @"用户注册";
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 1;
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.0f;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self configureBasicCell:tableView cellForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)configureBasicCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexpath {
    NSString *identifier = @"GKRegistrationTableViewCell";
    
    GKRegistrationTableViewCell *cell = (GKRegistrationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexpath];
    
    if (!cell) {
        cell = [[GKRegistrationTableViewCell alloc] init];
    }
    
    if (indexpath.section == 0) {
        switch (indexpath.row) {
            case 0:
            {
                cell.label.text = @"邮箱";
                cell.textField.placeholder = @"Email";
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                [[cell.textField rac_textSignal] subscribeNext:^(id x) {
                     self.registration.email = x;
                 }];
                
                
            }
                break;
            case 1:
            {
                cell.label.text = @"昵称";
                cell.textField.placeholder = @"昵称";
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                [[cell.textField rac_textSignal] subscribeNext:^(id x) {
                    self.registration.username = x;
                 }];
            }
                break;
            case 2:
            {
                cell.label.text = @"密码";
                cell.textField.placeholder = @"密码";
                cell.textField.secureTextEntry = YES;
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                [[cell.textField rac_textSignal] subscribeNext:^(id x) {
                    self.registration.password = x;
                    }];
            }
                break;
            default:
                break;
        }
    } else {
        UIColor *blueColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
        cell.label.textColor = blueColor;
        cell.label.text = @"注册";
        cell.textField.hidden = YES;
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    }

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        [self signup:nil];
    }
}



- (void(^)(GKUser *))didSignupUserSuccess
{
    return ^(GKUser *user) {
        [self.navigationController popViewControllerAnimated:YES];
        [self.hud hide:YES];
        if (self.signupDidSucceed)
            self.signupDidSucceed(self, [[GKUser alloc] init]);
    };
}

- (void(^)(NSError *))didSignupUserFailure
{
    return ^(NSError *error) {
        [[[UIAlertView alloc] initWithTitle:@"提示"
                                    message:error.localizedDescription
                                   delegate:nil
                          cancelButtonTitle:@"确定" otherButtonTitles:nil, nil]
         show];
        [self.hud hide:YES];
        if (self.signupDidFail)
            self.signupDidFail(error);
    };
}

- (IBAction)signup:(id)sender
{

    NSError *error = [self.registration valid];
    if (nil == error) {
        [self.hud show:YES];
        [[self.service signup:self.registration]
         subscribeNext:[self didSignupUserSuccess] error:[self didSignupUserFailure]];
        return;
    }
    
    [[[UIAlertView alloc] initWithTitle:@"提示"
                                message:error.localizedDescription delegate:nil
                      cancelButtonTitle:@"确定" otherButtonTitles:nil, nil]
     show];
    if (self.signupDidFail)
        self.signupDidFail(error);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
