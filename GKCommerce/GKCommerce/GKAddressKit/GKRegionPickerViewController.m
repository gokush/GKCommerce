//
//  AreaPickerViewController.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "GKRegionPickerViewController.h"

@implementation GKRegionPickerViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.view = [[UIPickerView alloc] init];
        self.view.dataSource = self;
        self.view.delegate   = self;
        self.hasTown         = YES;
        [RACObserve(self, province) subscribeNext:^(id x) {
            [self.view reloadComponent:0];
        }];
        [RACObserve(self, city) subscribeNext:^(id x) {
            [self.view reloadComponent:1];
        }];
    }
    return self;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    GKProvince *province;
    NSInteger count = 0;
    switch (component) {
        case 0: {
            count = self.province.count;
            province = self.province.firstObject;
            if (province.provinceID) {
                [[self.service citiesWithProvinceID:province.provinceID]
                 subscribeNext:^(id x) {
                     // 如果用RAC会crash
                    self.city = x;
                }];
                
            }
            break;
        }
        case 1: {
            count = self.city.count;
            break;
        }
        default:
            break;
    }
    return count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *current;
    if (0 == component)
        current = self.province;
    else if (1 == component)
        current = self.city;
    else if (2 == component)
        current = self.county;
    else if (3 == component)
        current = self.town;
  
    return ((GKRegion *)current[row]).name;
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    switch (component) {
        case 0: {
//            self.service citiesWithProvinceID:
            break;
        }
        case 1: {
            break;
        }
        default:
            break;
    }
//
//    if (nil == self.district || 0 == self.district.count)
//        return;
//    
//    NSInteger selectedIndex;
//    Region *selected;
//    if (2 == component) {
//        selectedIndex = row;
//    } else
//        selectedIndex = 0;
//    selected = [self.district objectAtIndex:selectedIndex];
//    
//    SEL selector = @selector(areaPickerViewController:didSelectArea:);
//    if ([self.delegate respondsToSelector:selector])
//        [self.delegate areaPickerViewController:self didSelectArea:selected];
}

- (void)show
{
    if ([self.view.subviews indexOfObject:self.view] > -1)
        return;
    
    [self.container.view addSubview:self.view];
    [UIView animateWithDuration:0.7 delay:0 options:0 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = self.container.view.frame.size.height - 216;
        self.view.frame = frame;
    } completion:^(BOOL finished) {
        RAC(self, province) = [[self.service provinces] logAll];
    }];
}

- (void)reloadData
{
    [self.view reloadAllComponents];
}

+ (instancetype)pickerWithViewController:(UIViewController *)viewController
{
    GKRegionPickerViewController *picker;
    picker = [[GKRegionPickerViewController alloc] init];
    picker.container = viewController;

    UIView *view = picker.view;
    CGRect frame = view.frame;
    frame.origin.y = viewController.view.frame.size.height;
    view.frame = frame;
    return picker;
}
@end
