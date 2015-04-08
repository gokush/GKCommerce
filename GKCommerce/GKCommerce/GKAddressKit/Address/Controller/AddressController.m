//
//  AddressController.m
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "AddressController.h"
#import "GKAddressCommon.h"
#import "AddressTableViewCell.h"

@interface AddressController ()

@end

@implementation AddressController

- (id)init
{
    self = [self initWithNibName:@"AddressView" bundle:nil];
    if (self) {
        
    }
    
    return self;
}

- (id)initWithAddress:(GKAddress *)address user:(GKUser *)anUser
{
    self = [self init];
    if (self) {
        self.address = address;
        self.user = anUser;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.address.isDefault)
        self.title = @"默认收货地址";
    else
        self.title = @"收货地址";
    for (NSString *identifier in @[@"AddressTableViewCell"])
        [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil]
             forCellReuseIdentifier:identifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger number;
    switch (section) {
        case 0:
            number = 5;
            break;
            
        default:
            number = 1;
            break;
    }
    
    return number;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    if (0 == section)
        return  0.0f;
    return 20.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:
            cell = [self addressFormCellForRowAtIndexPath:indexPath];
            break;
            
        default: {
            NSString *identifier = @"AddressDeleteTableViewCell";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[UITableViewCell alloc]
                        initWithStyle:UITableViewCellStyleDefault
                        reuseIdentifier:identifier];
            }
            cell.textLabel.text = @"删除收货地址";
            cell.textLabel.textColor = [UIColor redColor];
            break;
        }
    }
    
    return cell;
}

- (UITableViewCell *)addressFormCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddressTableViewCell *cell;
    cell = [self.tableView
            dequeueReusableCellWithIdentifier:@"AddressTableViewCell"];
    switch (indexPath.row) {
        case AddressNameCell: {
            cell.titleLabel.text = @"收货人";
            cell.contentLabel.text = self.address.name;
            break;
        }
        case AddressCellPhoneCell: {
            cell.titleLabel.text = @"手机号码";
            cell.contentLabel.text = self.address.cellPhone;
            break;
        }
        case AddressPostcodeCell: {
            cell.titleLabel.text = @"邮政编码";
            cell.contentLabel.text = self.address.postcode;
            break;
        }
        case AddressRegionCell: {
            cell.titleLabel.text = @"所在地区";
            cell.contentLabel.text = [self.address.province name];
            break;
        }
        case AddressStreetCell: {
            cell.titleLabel.text = @"详细地址";
            cell.contentLabel.text = self.address.address;
        }
        default:
            break;
    }
    
    return cell;
}

+ (instancetype)addressControllerWithMock
{
    AddressController *controller;
    GKAddress *address = [[GKAddress alloc] init];
    address.name = @"小悟空";
    address.cellPhone = @"15202171763";
    address.postcode = @"900032";
    address.address = @"大连西路";
  
  
  GKProvince *province = [[GKProvince alloc] init];
  province.name = @"上海市";
  
  GKCity *city = [[GKCity alloc] init];
  city.name = @"上海市";
  
  GKCounty *county = [[GKCounty alloc] init];
  county.name = @"虹口区";
  
  address.province = province;
  address.city = city;
  address.county = county;
    
    controller = [[AddressController alloc] initWithAddress:address user:nil];
    
    return controller;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
