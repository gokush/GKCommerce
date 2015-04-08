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
#import "GKProvince.h"
#import "GKCity.h"
#import "GKCounty.h"
#import "GKTown.h"
#import "GKVillage.h"

@interface GKRegionPickerViewController : NSObject
<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) id<GKAddressService> service;
@property (strong, nonatomic) UIPickerView *view;
@property (strong, nonatomic) NSArray *province;
@property (strong, nonatomic) NSArray *city;
@property (strong, nonatomic) NSArray *county;
@property (strong, nonatomic) NSArray *town;
@property (strong, nonatomic) NSArray *village;
@property (strong, nonatomic) GKProvince *selectedProvince;
@property (strong, nonatomic) GKCity *selectedCity;
@property (strong, nonatomic) GKCounty *selectedCounty;
@property (strong, nonatomic) GKTown *selectedTown;
@property (strong, nonatomic) GKVillage *selectedVillage;
@property (strong, nonatomic) UIViewController *container;
@property (assign, nonatomic) BOOL hasTown;

- (void)show;
- (void)reloadData;

+ (instancetype)pickerWithViewController:(UIViewController *)viewController;
@end
