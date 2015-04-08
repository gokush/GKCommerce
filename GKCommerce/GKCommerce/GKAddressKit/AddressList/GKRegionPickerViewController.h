//
//  AreaPickerViewController.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GKAddressService.h"

@class GKRegionPickerView;
@protocol RegionPickerViewControllerDelegate <NSObject>

//- (void)areaPickerViewController:(RegionPickerViewController *)picker
//                   didSelectArea:(Region *)anArea;
//
//- (void)areaPickerViewController:(RegionPickerViewController *)picker
//                         loading:(BOOL)isLoading;
@end

@interface GKRegionPickerView : UIPickerView
<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) UIPickerView *view;
@property (strong, nonatomic) id<GKAddressService> service;
@property (strong, nonatomic) NSArray *province;
@property (strong, nonatomic) NSArray *city;
@property (strong, nonatomic) NSArray *county;
@property (strong, nonatomic) NSArray *town;
@property (strong, nonatomic) NSArray *village;
@property (strong, nonatomic) UIViewController *container;
@property (strong, nonatomic) id<RegionPickerViewControllerDelegate> delegate;

- (void)show;
- (void)reloadData;

+ (instancetype)pickerWithViewController:(UIViewController *)viewController
                                   areas:(NSArray *)anAreas;;
@end
