//
//  ConsigneeEditController.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "ConsigneeEditController.h"
#import "ConsigneeDefines.h"
#import "ConsigneeEditInputTableViewCell.h"
#import "UIBindableTableViewCell.h"
#import "MBProgressHUD.h"


@interface ConsigneeEditController ()
@end

@implementation ConsigneeEditController

- (id)init
{
    self = [super initWithNibName:@"ConsigneeEditView" bundle:nil];
    if (self) {
        self.service = [[Dependency shared] consigneeService];
        self.service.delegate = self;

        self.areaPicker = [RegionPickerViewController
                           pickerWithViewController:self
                           areas:self.areas];
    }
    return self;
}

- (id)initWithConsignee:(Address *)consignee user:(User *)anUser
{
    self = [self init];
    
    if (self) {
        self.user = anUser;
        @weakify(self);
        [RACObserve(self, consignee) subscribeNext:^(Address *consignee) {
            @strongify(self);
            if (consignee.consigneeID > 0)
                [self.service consigneeWithID:consignee.consigneeID
                                         user:self.user];
        }];
        if (!consignee)
            self.consignee = [[Address alloc] init];
        else
            self.consignee = consignee;
    }
    return self;
}

- (void)consigneeBackend:(id<ConsigneeBackend> *)aConsigneeBackend
         didReceiveAreas:(NSArray *)areas
{
    self.areas = areas;
    self.areaPicker.country = areas;
    [self.areaPicker reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"ConsigneeEditInputTableViewCell"
                                bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:@"ConsigneeEditInputTableViewCell"];
    
    if (self.consignee.consigneeID > 0)
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
    ConsigneeEditInputTableViewCell *cell;
    cell = [tableView
            dequeueReusableCellWithIdentifier:@"ConsigneeEditInputTableViewCell"
            forIndexPath:indexPath];
    cell.inputTextField.tag = indexPath.row;
    cell.inputTextField.delegate = self;
    [cell.inputTextField addTarget:self action:@selector(textFieldDidChange:)
                  forControlEvents:UIControlEventEditingChanged];
    switch (indexPath.row) {
        case ConsigneeNameCell: {
            cell.inputTextField.placeholder = @"收货人姓名";
            break;
        }
        case ConsigneeCellPhoneCell: {
            cell.inputTextField.placeholder = @"手机号码";
            break;
        }
        case ConsigneePostcodeCell: {
            cell.inputTextField.placeholder = @"邮政编码";
            break;
        }
        case ConsigneeAreaCell: {
            cell.inputTextField.placeholder = @"省、市、区";
            cell.inputTextField.enabled = NO;
            cell.consignee = self.consignee;
            [cell bind];
            break;
        }
        case ConsigneeAddressCell: {
            cell.inputTextField.placeholder = @"详细地址";
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
        case ConsigneeAreaCell:
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
        case ConsigneeAreaCell: {
            [self.areaPicker show];
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
            self.consignee.district = anArea;
            break;
        }
        case RegionTypeCity: {
            [self areaPickerViewController:picker didSelectArea:anArea.parent];
            self.consignee.city = anArea;
            break;
        }
        case RegionTypeProvince: {
            self.consignee.province = anArea;
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
        case ConsigneeNameCell: {
            self.consignee.name = textField.text;
            break;
        }
        case ConsigneeCellPhoneCell: {
            self.consignee.cellPhone = textField.text;
            break;
        }
        case ConsigneePostcodeCell: {
            self.consignee.postcode = textField.text;
            break;
        }
        case ConsigneeAddressCell: {
            self.consignee.address = textField.text;
            break;
        }
        default:
            break;
    }
}

- (void)didTapSave:(id)sender
{
    NSString *message;
    if (0 == self.consignee.name.length)
        message = @"收货人姓名不能是空";
    else if (0 == self.consignee.cellPhone.length)
        message = @"收货人手机号码不能是空";
    else if (!(self.consignee.province && self.consignee.city &&
               self.consignee.district))
        message = @"请选择地区";
    else if (0 == self.consignee.address.length)
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
