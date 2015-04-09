//
//  GKForgotPasswordController.m
//  GKUserKitExample
//
//  Created by MASGG on 15-2-22.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import "GKForgotPasswordController.h"
#import "GKRegistrationTableViewCell.h"
#import "GKVerificationTableViewCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#define kVerificationTime 10;
@interface GKForgotPasswordController (){
    BOOL _isValided;
    int _verificationTime;
    NSTimer *_timer;
 
}
@property (strong, nonatomic) GKVerificationTableViewCell *verificationCell;
@end

@implementation GKForgotPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for (NSString* identifier in @[@"GKRegistrationTableViewCell",@"GKVerificationTableViewCell"]) {
        [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil]
             forCellReuseIdentifier:identifier];
    }
    _verificationTime=kVerificationTime;
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_isValided) {
        return 4;
    }else{
        return 2;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    NSString *identifier = @"GKRegistrationTableViewCell";
    UITableViewCell *cell;
    switch (indexPath.row) {
        case 0:{
            GKRegistrationTableViewCell *registrationCell = (GKRegistrationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
            registrationCell.label.text=@"手机号";
            registrationCell.textField.placeholder=@"请输入手机号或邮箱";
            cell=registrationCell;
            break;
        }
        case 1:{
            identifier = @"GKVerificationTableViewCell";
            _verificationCell = (GKVerificationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
            [_verificationCell.btnVerification addTarget:self action:@selector(verifiation:) forControlEvents:UIControlEventTouchUpInside];
            _verificationCell.btnVerification.layer.cornerRadius=8;
            _verificationCell.btnVerification.layer.masksToBounds=YES;
            [_verificationCell.btnVerification setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            _verificationCell.btnVerification.backgroundColor=[UIColor redColor];
            cell=_verificationCell;
            break;
        }
        case 2:{
            GKRegistrationTableViewCell *registrationCell = (GKRegistrationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
            registrationCell.label.text=@"新密码";
            registrationCell.textField.placeholder=@"请输入新密码";
            cell=registrationCell;
            break;
        }
        case 3:{
            GKRegistrationTableViewCell *registrationCell = (GKRegistrationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
            registrationCell.label.text=@"确认密码";
            registrationCell.textField.placeholder=@"请确认密码";
            cell=registrationCell;
            break;
        }
        default:
            break;
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.0f;
}

- (void)verifiation:(id) sender
{
    
    RAC(self, self.verificationCell.btnVerification.titleLabel.text) = [[[RACSignal interval:1 onScheduler:[RACScheduler currentScheduler]] startWith:[NSDate date]] map:^id (NSDate *value) {
        NSLog(@"value:%@", value);
        NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond |
                                            NSCalendarUnitMinute |
                                            NSCalendarUnitSecond fromDate:value];
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)dateComponents.hour, (long)dateComponents.minute, (long)dateComponents.second];
    }];
    
    
    if (_timer) {
        [_timer invalidate];
    }
    _timer =[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(reduceTime) userInfo:nil repeats:YES];
    [_timer fire];
        
    
}
- (void) reduceTime
{
    _verificationTime--;
    [_verificationCell.btnVerification setTitle:[NSString stringWithFormat:@"%d",_verificationTime] forState:UIControlStateNormal];
    if (_verificationTime==0) {
        _isValided=YES;
        [self.tableView reloadData];
        [_timer invalidate];
        _timer=nil;
        [_verificationCell.btnVerification setTitle:@"重新获取" forState:UIControlStateNormal];
    }
}
@end
