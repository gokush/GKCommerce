//
//  AreaPickerViewController.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "AreaPickerViewController.h"

@implementation AreaPickerViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.backend = [[ConsigneeBackend alloc] init];
        self.backend.delegate = self;
        [self.backend requestAreas];
        self.view = [[UIPickerView alloc] init];
        self.view.dataSource = self;
        self.view.delegate   = self;
    }
    return self;
}

- (void)setAreas:(NSArray *)areas
{
    if (_areas != areas) {
        _areas = areas;
        if ([areas firstObject])
            self.areas2 = [[areas firstObject] children];
        if (self.areas2)
            self.areas3 = [[self.areas3 firstObject] children];
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if (0 == component && self.areas && self.areas.count > 0)
        return self.areas.count;
    else if (1 == component && self.areas2)
        return self.areas2.count;
    else if (2 == component && self.areas3)
        return self.areas3.count;
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
        current = self.areas;
    else if (1 == component)
        current = self.areas2;
    else if (2 == component)
        current = self.areas3;

    if (nil == current)
        return @"";
    
    Area *area = (Area *)[current objectAtIndex:row];
    return area.name;
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    switch (component) {
        case 0: {
            if (self.areas)
                self.areas2 = [[self.areas objectAtIndex:row] children];
            if (self.areas2 && [[self.areas2 objectAtIndex:row] children])
                self.areas3 = [[self.areas2 objectAtIndex:row] children];
            [pickerView reloadComponent:1];
            [pickerView reloadComponent:2];
            break;
        }
        case 1: {
            if (self.areas2)
                self.areas3 = [[self.areas2 objectAtIndex:row] children];
            [pickerView reloadComponent:2];
            break;
        }
        default:
            break;
    }
    
    if (nil == self.areas3 || 0 == self.areas3.count)
        return;
    
    NSInteger selectedIndex;
    Area *selected;
    if (2 == component) {
        selectedIndex = row;
    } else
        selectedIndex = 0;
    selected = [self.areas3 objectAtIndex:selectedIndex];
    
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
    AreaPickerViewController *picker = [[AreaPickerViewController alloc] init];
    picker.areas = anAreas;
    picker.container = viewController;
    if ([viewController
         conformsToProtocol:@protocol(AreaPickerViewControllerDelegate)])
        
        picker.delegate = (id<AreaPickerViewControllerDelegate>)viewController;
    
    UIView *view = picker.view;
    CGRect frame = view.frame;
    frame.origin.y = viewController.view.frame.size.height;
    view.frame = frame;
    return picker;
}
@end
