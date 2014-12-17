//
//  AreaPickerViewController.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "RegionPickerViewController.h"

@implementation RegionPickerViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.service = [[Dependency shared] consigneeService];
        self.service.delegate = self;
        
//        [self.service requestRegion:Region];
        self.view = [[UIPickerView alloc] init];
        self.view.dataSource = self;
        self.view.delegate   = self;
    }
    return self;
}

- (void)setCountry:(NSArray *)areas
{
    if (_country != areas) {
        _country = areas;
        if ([areas firstObject])
            self.province = [[areas firstObject] children];
        if (self.province)
            self.district = [[self.district firstObject] children];
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if (0 == component && self.country && self.country.count > 0)
        return self.country.count;
    else if (1 == component && self.province)
        return self.province.count;
    else if (2 == component && self.district)
        return self.district.count;
    return 0;
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
        current = self.country;
    else if (1 == component)
        current = self.province;
    else if (2 == component)
        current = self.district;

    if (nil == current)
        return @"";
    
    Region *area = (Region *)[current objectAtIndex:row];
    return area.name;
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    switch (component) {
        case 0: {
            if (self.country)
                self.province = [[self.country objectAtIndex:row] children];
            if (self.province && [[self.province objectAtIndex:row] children])
                self.district = [[self.province objectAtIndex:row] children];
            [pickerView reloadComponent:1];
            [pickerView reloadComponent:2];
            break;
        }
        case 1: {
            if (self.province)
                self.district = [[self.province objectAtIndex:row] children];
            [pickerView reloadComponent:2];
            break;
        }
        default:
            break;
    }
    
    if (nil == self.district || 0 == self.district.count)
        return;
    
    NSInteger selectedIndex;
    Region *selected;
    if (2 == component) {
        selectedIndex = row;
    } else
        selectedIndex = 0;
    selected = [self.district objectAtIndex:selectedIndex];
    
    SEL selector = @selector(areaPickerViewController:didSelectArea:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate areaPickerViewController:self didSelectArea:selected];
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
        
    }];
}

- (void)reloadData
{
    [self.view reloadAllComponents];
}

+ (instancetype)pickerWithViewController:(UIViewController *)viewController
                                   areas:(NSArray *)anAreas
{
    RegionPickerViewController *picker = [[RegionPickerViewController alloc] init];
    picker.country = anAreas;
    picker.container = viewController;
    
    if ([viewController
         conformsToProtocol:@protocol(RegionPickerViewControllerDelegate)])
        
        picker.delegate = (id<RegionPickerViewControllerDelegate>)viewController;
    
    UIView *view = picker.view;
    CGRect frame = view.frame;
    frame.origin.y = viewController.view.frame.size.height;
    view.frame = frame;
    return picker;
}
@end
