//
//  AreaPickerViewController.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ConsigneeBackend.h"

@class AreaPickerViewController;
@protocol AreaPickerViewControllerDelegate <NSObject>

- (void)areaPickerViewController:(AreaPickerViewController *)picker
                   didSelectArea:(Area *)anArea;
@end

@interface AreaPickerViewController : NSObject
<UIPickerViewDataSource, UIPickerViewDelegate, ConsigneeBackendDelegate>

@property (strong, nonatomic) UIPickerView *view;
@property (strong, nonatomic) ConsigneeBackend *backend;
@property (strong, nonatomic) NSArray *areas;
@property (strong, nonatomic) NSArray *areas2;
@property (strong, nonatomic) NSArray *areas3;
@property (strong, nonatomic) UIViewController *container;
@property (strong, nonatomic) id<AreaPickerViewControllerDelegate> delegate;

- (void)show;
- (void)reloadData;

+ (instancetype)pickerWithViewController:(UIViewController *)viewController
                                   areas:(NSArray *)anAreas;;
@end
