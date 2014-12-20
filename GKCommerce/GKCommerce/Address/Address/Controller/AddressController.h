//
//  AddressController.h
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address.h"

@interface AddressController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Address *address;
@property (strong, nonatomic) User *user;

- (id)initWithAddress:(Address *)address user:(User *)anUser;
+ (instancetype)addressControllerWithMock;
@end
