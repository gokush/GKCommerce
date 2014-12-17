//
//  AreaPickerViewController.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ConsigneeService.h"

@class RegionPickerViewController;
@protocol RegionPickerViewControllerDelegate <NSObject>

- (void)areaPickerViewController:(RegionPickerViewController *)picker
                   didSelectArea:(Region *)anArea;

- (void)areaPickerViewController:(RegionPickerViewController *)picker
                         loading:(BOOL)isLoading;
@end

@interface RegionPickerViewController : NSObject
<UIPickerViewDataSource, UIPickerViewDelegate, ConsigneeServiceDelegate>

@property (strong, nonatomic) UIPickerView *view;
@property (strong, nonatomic) id<ConsigneeService> service;
@property (strong, nonatomic) NSArray *country;
@property (strong, nonatomic) NSArray *province;
@property (strong, nonatomic) NSArray *district;
@property (strong, nonatomic) UIViewController *container;
@property (strong, nonatomic) id<RegionPickerViewControllerDelegate> delegate;

- (void)show;
- (void)reloadData;

+ (instancetype)pickerWithViewController:(UIViewController *)viewController
                                   areas:(NSArray *)anAreas;;
@end
