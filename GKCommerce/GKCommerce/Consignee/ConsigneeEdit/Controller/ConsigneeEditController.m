//
//  ConsigneeEditController.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "ConsigneeEditController.h"
#import "ConsigneeEditInputTableViewCell.h"

typedef enum {
    ConsigneeAreaCell
} ConsigneeCell;

@interface ConsigneeEditController ()
@end

@implementation ConsigneeEditController

- (id)init
{
    self = [super initWithNibName:@"ConsigneeEditView" bundle:nil];
    if (self) {
        self.backend = [[ConsigneeBackend alloc] init];
        self.backend.delegate = self;
        [self.backend requestAreas];
        self.areaPicker = [AreaPickerViewController
                           pickerWithViewController:self
                           areas:self.areas];
    }
    return self;
}

- (void)consigneeBackend:(ConsigneeBackend *)aConsigneeBackend
         didReceiveAreas:(NSArray *)areas
{
    self.areas = areas;
    self.areaPicker.areas = areas;
    [self.areaPicker reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"ConsigneeEditInputTableViewCell"
                                bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:@"ConsigneeEditInputTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ConsigneeEditInputTableViewCell *cell;
    cell = [tableView
            dequeueReusableCellWithIdentifier:@"ConsigneeEditInputTableViewCell"
            forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case ConsigneeAreaCell: {
            cell.inputTextField.placeholder = @"省、市、区";
            cell.inputTextField.enabled = NO;
            break;
        }
        default:
            break;
    }
    
    return cell;
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

- (void)areaPickerViewController:(AreaPickerViewController *)picker
                   didSelectArea:(Area *)anArea
{
    
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
