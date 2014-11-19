//
//  MineViewController.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "MineDefaultViewController.h"
#import "MineDefaultTableViewCell.h"
#import "MineHeaderPhotoTableViewCell.h"
#import "UserAuthenticationViewController.h";
#import "ConsigneeEditController.h"
#import "ConsigneeController.h"
#import "ConsigneeListController.h"

typedef enum {
    HeaderPhotoSection,
    SecondSection,
    ThirdSection
} MineSection;

typedef enum {
    HeaderPhotoCell
} HeaderPhotoSectionCell;

typedef enum {
    FavorCell,
    OrderCell,
    ConsigneeCell,
    AccountCell
} SecondSectionCell;

typedef enum {
    AboutUsCell
} ThirdSectionCell;

@interface MineDefaultViewController ()

@end

@implementation MineDefaultViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    ConsigneeEditController *controller;
//    controller = [[ConsigneeEditController alloc] initWithConsignee:nil];
//    ConsigneeListController *controller;
//    controller = [ConsigneeListController consigneeListControllerWithMock];
//    [self.navigationController pushViewController:controller animated:YES];
    
    for (NSString *identifer in @[@"MineDefaultTableViewCell",
                                  @"MineHeaderPhotoTableViewCell"]) {
        
        [self.tableView registerNib:[UINib nibWithNibName:identifer bundle:nil]
             forCellReuseIdentifier:identifer];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    switch (indexPath.section) {
        case HeaderPhotoSection: {
            height = 140.0f;
            break;
        }
        case SecondSection:
        case ThirdSection:
            height = 44.0f;
            break;
        default:
            break;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case HeaderPhotoSection:
            return 0.0f;
            break;
            
        default:
            break;
    }
    
    return 20.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger number;
    switch (section) {
        case HeaderPhotoSection:
            number = 1;
            break;
        case SecondSection:
            number = 4;
            break;
        case ThirdSection:
            number = 1;
        default:
            break;
    }
    return number;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case HeaderPhotoCell:
            cell = [self headerPhotoCellForRowAtIndexPath:indexPath];
            break;
        case SecondSection:
            cell = [self secondSectionCellForRowAtIndexPath:indexPath];
            break;
        case ThirdSection:
            cell = [self thirdSectionCellForRowAtIndexPath:indexPath];
            break;
        default:
            break;
    }
    
    return cell;
}

- (UITableViewCell *)headerPhotoCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellName = @"MineHeaderPhotoTableViewCell";
    MineHeaderPhotoTableViewCell *cell;
    cell = [self.tableView dequeueReusableCellWithIdentifier:cellName
                                           forIndexPath:indexPath];
    cell.delegate = self;
    return cell;
}

- (UITableViewCell *)secondSectionCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellName = @"MineDefaultTableViewCell";
    MineDefaultTableViewCell *cell;
    cell = [self.tableView dequeueReusableCellWithIdentifier:cellName
                                           forIndexPath:indexPath];
    
    static NSArray *icons;
    static NSArray *titles;
    icons = @[@"mine_icon_favor", @"mine_icon_order", @"mine_icon_consignee",
              @"mine_icon_account"];
    titles = @[@"我的关注", @"我的订单", @"地址管理", @"我的账户"];

    UIImage *iconImage;
    iconImage = [UIImage imageNamed:[icons objectAtIndex:indexPath.row]];
    cell.iconImageView.image = iconImage;
    cell.titleLabel.text = [titles objectAtIndex:indexPath.row];
    return cell;
}

- (UITableViewCell *)thirdSectionCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellName = @"MineDefaultTableViewCell";
    MineDefaultTableViewCell *cell;
    cell = [self.tableView dequeueReusableCellWithIdentifier:cellName
                                                forIndexPath:indexPath];
    switch (indexPath.row) {
        case AboutUsCell: {
            UIImage *iconImage;
            iconImage = [UIImage imageNamed:@"mine_icon_about"];
            cell.iconImageView = [[UIImageView alloc] initWithImage:iconImage];
            cell.titleLabel.text = @"关于我们";
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
    switch (indexPath.section) {
        case HeaderPhotoSection:
            [tableView deselectRowAtIndexPath:indexPath animated:NO];
            break;
            
        default:
            break;
    }
}

- (void)headerPhoto:(MineHeaderPhotoTableViewCell *)headerPhoto
       didTapSignup:(id)signupButton
{
    
}

- (void)headerPhoto:(MineHeaderPhotoTableViewCell *)headerPhoto
 didTapAuthenticate:(id)authenticateButton
{
    UserAuthenticationViewController *controller;
    controller = [[UserAuthenticationViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
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
