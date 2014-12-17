//
//  ConsigneeController.m
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ConsigneeController.h"
#import "ConsigneeDefines.h"
#import "ConsigneeTableViewCell.h"

@interface ConsigneeController ()

@end

@implementation ConsigneeController

- (id)init
{
    self = [self initWithNibName:@"ConsigneeView" bundle:nil];
    if (self) {
        
    }
    
    return self;
}

- (id)initWithConsignee:(Address *)consignee user:(User *)anUser
{
    self = [self init];
    if (self) {
        self.consignee = consignee;
        self.user = anUser;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.consignee.defaultConsignee)
        self.title = @"默认收货地址";
    else
        self.title = @"收货地址";
    for (NSString *identifier in @[@"ConsigneeTableViewCell"])
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
            cell = [self consigneeFormCellForRowAtIndexPath:indexPath];
            break;
            
        default: {
            NSString *identifier = @"ConsigneeDeleteTableViewCell";
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

- (UITableViewCell *)consigneeFormCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ConsigneeTableViewCell *cell;
    cell = [self.tableView
            dequeueReusableCellWithIdentifier:@"ConsigneeTableViewCell"];
    switch (indexPath.row) {
        case ConsigneeNameCell: {
            cell.titleLabel.text = @"收货人";
            cell.contentLabel.text = self.consignee.name;
            break;
        }
        case ConsigneeCellPhoneCell: {
            cell.titleLabel.text = @"手机号码";
            cell.contentLabel.text = self.consignee.cellPhone;
            break;
        }
        case ConsigneePostcodeCell: {
            cell.titleLabel.text = @"邮政编码";
            cell.contentLabel.text = self.consignee.postcode;
            break;
        }
        case ConsigneeAreaCell: {
            cell.titleLabel.text = @"所在地区";
            cell.contentLabel.text = [self.consignee.district description];
            break;
        }
        case ConsigneeAddressCell: {
            cell.titleLabel.text = @"详细地址";
            cell.contentLabel.text = self.consignee.address;
        }
        default:
            break;
    }
    
    return cell;
}

+ (instancetype)consigneeControllerWithMock
{
    ConsigneeController *controller;
    Address *consignee = [[Address alloc] init];
    consignee.name = @"小悟空";
    consignee.cellPhone = @"15202171763";
    consignee.postcode = @"900032";
    consignee.address = @"大连西路";
    
    Region *provice = [[Region alloc] init];
    provice.name = @"上海市";
    
    Region *city = [[Region alloc] init];
    city.name = @"上海市";
    city.parent = provice;
    
    Region *district = [[Region alloc] init];
    district.name = @"虹口区";
    district.parent = city;

    consignee.district = district;
    consignee.city = city;
    consignee.province = provice;
    
    controller = [[ConsigneeController alloc] initWithConsignee:consignee];
    
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
