//
//  AddressEditController.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressService.h"
#import "RegionPickerViewController.h"

@interface AddressEditController : UIViewController
<UITableViewDataSource, UITableViewDelegate, AddressServiceDelegate,
RegionPickerViewControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) id<AddressService> service;
@property (strong, nonatomic) NSArray *regions;
@property (strong, nonatomic) RegionPickerViewController *regionPicker;
@property (strong, nonatomic) Address *address;
@property (strong, nonatomic) User *user;

- (id)initWithAddress:(Address *)address user:(User *)anUser;
@end
