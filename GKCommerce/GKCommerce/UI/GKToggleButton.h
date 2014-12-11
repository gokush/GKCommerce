//
//  UIToggleButton.h
//  GKCommerce
//
//  Created by 小悟空 on 11/24/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GKToggleButton;
@protocol GKToggleButtonDelegate <NSObject>

- (void)toggleButton:(GKToggleButton *)aToggleButton didSwitch:(BOOL)onOrOff;
@end

IB_DESIGNABLE
@interface GKToggleButton : UIView

@property (assign, nonatomic) IBInspectable BOOL on;
@property (strong, nonatomic) IBInspectable UIImage *onImage;
@property (strong, nonatomic) IBInspectable UIImage *offImage;
@property (strong, nonatomic) IBOutlet id<GKToggleButtonDelegate> delegate;
- (void)tapButton;
@end
