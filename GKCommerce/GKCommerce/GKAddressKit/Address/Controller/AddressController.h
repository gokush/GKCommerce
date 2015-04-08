//
//  AddressController.h
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKAddressCommon.h"

@interface AddressController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) GKAddress *address;
@property (strong, nonatomic) GKUser *user;

- (id)initWithAddress:(GKAddress *)address user:(GKUser *)anUser;
+ (instancetype)addressControllerWithMock;
@end
