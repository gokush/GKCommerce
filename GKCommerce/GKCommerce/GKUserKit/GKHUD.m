//
//  GKHUD.m
//  GKUserKitExample
//
//  Created by 小悟空 on 3/6/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface GKHUD()
@property (strong, nonatomic) MBProgressHUD *mbProgressHUD;
@end

@implementation GKHUD

- (id)initWithMBProgressHUD:(MBProgressHUD *)mbProgressHUD
                   rootView:(UIView *)view
{
    self = [super init];
    if (self) {
        self.mbProgressHUD = mbProgressHUD;
        self.rootView = view;
    }
    return self;
}

- (void)showMessage:(NSString *)message hideAfterDelay:(NSTimeInterval)second
{
    self.mbProgressHUD.mode = MBProgressHUDModeCustomView;
    [self.rootView addSubview:self.mbProgressHUD];
    [self.mbProgressHUD show:YES];
    [self.mbProgressHUD hide:YES afterDelay:second];
}

- (void)show:(BOOL)animated
{
    self.mbProgressHUD.mode = MBProgressHUDModeIndeterminate;
    [self.rootView addSubview:self.mbProgressHUD];
    [self.mbProgressHUD show:animated];
}

- (void)hide:(BOOL)animated
{
    [self.mbProgressHUD hide:animated];
}

+ (void)setHUD:(GKHUD *)hud
{
}

+ (instancetype)defaultHUD
{
    UIView *view = [[[[[UIApplication sharedApplication] delegate] window]
                     rootViewController] view];
    MBProgressHUD *progress = [[MBProgressHUD alloc] initWithView:view];
    return [[GKHUD alloc] initWithMBProgressHUD:progress rootView:view];
}
@end
