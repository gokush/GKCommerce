//
//  CheckoutChoiceAddressController.m
//  GKCommerce
//
//  Created by 小悟空 on 3/31/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "CheckoutChoiceAddressController.h"
#import "CheckoutChoiceAddressTableViewCell.h"
#import "GKAddress.h"

@interface CheckoutChoiceAddressController ()

@property (strong, nonatomic) NSString *cellIdentifier;
@end

@implementation CheckoutChoiceAddressController

- (id)init
{
    self = [self initWithNibName:@"CheckoutChoiceAddressView" bundle:nil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GKAddress *address1 = [[GKAddress alloc] init];
    address1.name = @"小悟空";
    address1.cellPhone = @"15002171763";
    address1.address = @"中国上海市静安区愚园东路28号东海广场People square联合创业办公室";
    self.addresses = @[address1];
    
    self.cellIdentifier = @"CheckoutChoiceAddressTableViewCell";
    [self.tableView registerNib:[UINib nibWithNibName:self.cellIdentifier
                                               bundle:nil]
         forCellReuseIdentifier:self.cellIdentifier];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = self.addresses.count;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CheckoutChoiceAddressTableViewCell *cell;
    cell = [self.tableView
            dequeueReusableCellWithIdentifier:self.cellIdentifier];
    GKAddress *address = [self.addresses objectAtIndex:indexPath.row];
    [self configureAddressCell:cell address:address];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static CheckoutChoiceAddressTableViewCell *cell;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = [self.tableView
                dequeueReusableCellWithIdentifier:self.cellIdentifier];
    });
    
    GKAddress *address;
    address = [self.addresses objectAtIndex:indexPath.row];
    
    [self configureAddressCell:cell address:address];
    
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    CGSize size = [cell.contentView
                   systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f;
}

- (void)configureAddressCell:(CheckoutChoiceAddressTableViewCell *)cell
                     address:(GKAddress *)anAddress
{
    cell.nameLabel.text = anAddress.name;
    cell.phoneNumberLabel.text = anAddress.cellPhone;
    cell.addressLabel.text = anAddress.address;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GKAddress *address = self.addresses[indexPath.row];
    [self.chosen sendNext:address];
    [self.navigationController popViewControllerAnimated:YES];
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
