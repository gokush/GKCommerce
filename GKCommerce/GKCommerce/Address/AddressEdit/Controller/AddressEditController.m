//
//  AddressEditController.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "AddressEditController.h"
#import "AddressDefines.h"
#import "AddressEditInputTableViewCell.h"
#import "UIBindableTableViewCell.h"
#import "MBProgressHUD.h"


@interface AddressEditController ()
@end

@implementation AddressEditController

- (id)init
{
    self = [super initWithNibName:@"AddressEditView" bundle:nil];
    if (self) {
        self.service = [[Dependency shared] addressService];
        self.service.delegate = self;

        self.regionPicker = [RegionPickerViewController
                           pickerWithViewController:self
                           areas:self.regions];
    }
    return self;
}

- (id)initWithAddress:(Address *)address user:(User *)anUser
{
    self = [self init];
    
    if (self) {
        self.user = anUser;
        @weakify(self);
        [RACObserve(self, address) subscribeNext:^(Address *address) {
            @strongify(self);
            if (address.addressID > 0) {
                [self.service addressWithID:address.addressID
                                      user:self.user];
                self.title = @"修改收货地址";
            } else {
                self.title = @"新增收货地址";
            }
        }];
        if (!address)
            self.address = [[Address alloc] init];
        else
            self.address = address;
    }
    return self;
}

- (void)addressBackend:(id<AddressBackend> *)anAddressBackend
      didReceiveRegion:(NSArray *)areas
{
    self.regions = areas;
    self.regionPicker.country = areas;
    [self.regionPicker reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"AddressEditInputTableViewCell"
                                bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:@"AddressEditInputTableViewCell"];
    
    if (self.address.addressID > 0)
        self.title = @"修改收货地址";
    else
        self.title = @"新增收货地址";
    
    UIBarButtonItem *save = [[UIBarButtonItem alloc]
                             initWithTitle:@"保存"
                             style:UIBarButtonItemStylePlain target:self
                             action:@selector(didTapSave:)];
    self.navigationItem.rightBarButtonItem = save;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  AddressEditInputTableViewCell *cell;
  cell = [tableView
          dequeueReusableCellWithIdentifier:@"AddressEditInputTableViewCell"
          forIndexPath:indexPath];
  cell.inputTextField.tag = indexPath.row;
  cell.inputTextField.delegate = self;
  [cell.inputTextField addTarget:self action:@selector(textFieldDidChange:)
                forControlEvents:UIControlEventEditingChanged];
  switch (indexPath.row) {
    case AddressNameCell: {
      cell.inputTextField.placeholder = @"收货人姓名";
      if (nil != self.address)
        cell.textLabel.text = self.address.name;
      break;
    }
    case AddressCellPhoneCell: {
      cell.inputTextField.placeholder = @"手机号码";
      if (nil != self.address)
        cell.textLabel.text = self.address.cellPhone;
      break;
    }
    case AddressPostcodeCell: {
      cell.inputTextField.placeholder = @"邮政编码";
      if (nil != self.address)
        cell.textLabel.text = self.address.postcode;
      break;
    }
    case AddressRegionCell: {
      cell.inputTextField.placeholder = @"省、市、区";
      cell.inputTextField.enabled = NO;
      cell.address = self.address;
      [cell bind];
      break;
    }
    case AddressStreetCell: {
      cell.inputTextField.placeholder = @"详细地址";
      if (nil != self.address)
        cell.textLabel.text = self.address.address;
      break;
    }
    default:
      break;
  }
  
  return cell;
}

- (void)tableView:(UITableView *)tableView
didEndDisplayingCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case AddressRegionCell:
            if ([cell respondsToSelector:@selector(unbind)])
                [cell performSelector:@selector(unbind)];
            break;
            
        default:
            break;
    }
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case AddressRegionCell: {
            [self.regionPicker show];
            break;
        }
            
        default:
            break;
    }
}

- (void)areaPickerViewController:(RegionPickerViewController *)picker
                   didSelectArea:(Region *)anArea
{
    switch (anArea.type) {
        case RegionTypeDistrict: {
            [self areaPickerViewController:picker didSelectArea:anArea.parent];
            self.address.district = anArea;
            break;
        }
        case RegionTypeCity: {
            [self areaPickerViewController:picker didSelectArea:anArea.parent];
            self.address.city = anArea;
            break;
        }
        case RegionTypeProvince: {
            self.address.province = anArea;
            break;
        }
        default:
            break;
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (void)textFieldDidChange:(id)sender
{
    UITextField *textField = sender;
    switch (textField.tag) {
        case AddressNameCell: {
            self.address.name = textField.text;
            break;
        }
        case AddressCellPhoneCell: {
            self.address.cellPhone = textField.text;
            break;
        }
        case AddressPostcodeCell: {
            self.address.postcode = textField.text;
            break;
        }
        case AddressStreetCell: {
            self.address.address = textField.text;
            break;
        }
        default:
            break;
    }
}

- (void)didTapSave:(id)sender
{
    NSString *message;
    if (0 == self.address.name.length)
        message = @"收货人姓名不能是空";
    else if (0 == self.address.cellPhone.length)
        message = @"收货人手机号码不能是空";
    else if (!(self.address.province && self.address.city &&
               self.address.district))
        message = @"请选择地区";
    else if (0 == self.address.address.length)
        message = @"地址不能是空";
    
    if (message) {
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
        hud.labelText = message;
        hud.mode = MBProgressHUDModeCustomView;
        [self.view addSubview:hud];
        [hud show:YES];
        
        [hud hide:YES afterDelay:2];
        return;
    }
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
