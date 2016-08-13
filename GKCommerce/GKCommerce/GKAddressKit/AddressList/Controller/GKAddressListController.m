//
//  AddressListController.m
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "GKAddressListController.h"
#import "AddressListTableViewCell.h"
#import "AddressEditController.h"

@interface GKAddressListController ()

@end

@implementation GKAddressListController
//objection_requires(@"service")
objection_requires_sel(@selector(service))
- (id)init
{
  self = [self initWithNibName:@"AddressListView" bundle:nil];
  if (self) {
  }
  return self;
}

- (id)initWithUser:(GKUser *)user
{
  self = [self init];
  if (self) {
    self.user = user;
      [self setup];
  }
  return self;
}

- (id)initWithAddress:(NSArray *)addresses
{
  self = [self init];
  self.addresses = addresses;
  return self;
}

- (void)setup
{
    
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  UIBarButtonItem *rightButton;
  rightButton = [[UIBarButtonItem alloc]
                 initWithTitle:@"新增" style:UIBarButtonItemStylePlain
                 target:self action:@selector(didTapAddAddress:)];
  self.navigationItem.rightBarButtonItem = rightButton;
  
  for (NSString *identifier in @[@"AddressListTableViewCell"])
    [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil]
         forCellReuseIdentifier:identifier];
  
  RAC(self, addresses) = [self.service addressesWithUser:self.user];
  [RACObserve(self, addresses) subscribeNext:^(NSArray *address) {
    [self.tableView reloadData];
  }];
}

- (void)didTapAddAddress:(id)sender
{
    AddressEditController *controller;
    controller = [[AddressEditController alloc]
                  initWithAddress:nil user:self.user];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
  return self.addresses.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 89.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  AddressListTableViewCell *cell;
  GKAddress *address;
  cell = [tableView
          dequeueReusableCellWithIdentifier:@"AddressListTableViewCell"];
  address = [self.addresses objectAtIndex:indexPath.row];
  cell.address = address;
  
  return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GKAddress *address;
    AddressEditController *controller;
    address = self.addresses[indexPath.row];
    controller = [[AddressEditController alloc]
                  initWithAddress:address user:self.user];
    [self.navigationController pushViewController:controller animated:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
