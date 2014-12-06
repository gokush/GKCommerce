//
//  CartEmptyViewController.h
//  GKCommerce
//
//  Created by 小悟空 on 12/6/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartEmptyViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet GKButton *actionButton;
@property (assign, nonatomic) BOOL authenticated;
+ (instancetype)shared;
@end
