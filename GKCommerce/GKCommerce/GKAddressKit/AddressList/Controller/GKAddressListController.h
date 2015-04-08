//
//  AddressListController.h
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKAddressCommon.h"

@interface GKAddressListController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) GKUser *user;
@property (strong, nonatomic) NSArray *addresses;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) id<GKAddressService> service;
- (id)initWithAddress:(NSArray *)addresses;
- (id)initWithUser:(GKUser *)user;

@end
