//
//  InvoiceViewController.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/4.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "InvoiceViewController.h"

typedef enum {
    InvoiceSectionTitle,
    InvoiceSectionContent
} InvoiceSection;

@interface InvoiceViewController ()

@end

@implementation InvoiceViewController

- (id)initWithCart:(Cart *)cart
{
    self = [super initWithNibName:@"InvoiceView" bundle:nil];
    if (self) {
        self.cart = cart;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTapConfirm:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (self.cart.invoice.contents)
        return self.cart.invoice.contents.count;
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
//    if (0 == indexPath.row) {
//        InvoiceHeadTableViewCell *invoiceHeadCell;
//        invoiceHeadCell = [tableView
//                dequeueReusableCellWithIdentifier:@"InvoiceHeadTableViewCell"];
//        switch (indexPath.section) {
//            case InvoiceSectionTitle: {
//                invoiceHeadCell.titleLabel.text = @"发票抬头";
//                break;
//            }
//            case InvoiceSectionContent: {
//                invoiceHeadCell.titleLabel.text = @"发票商品";
//                break;
//            }
//            default:
//                break;
//        }
//        cell = invoiceTitleCell;
//    } else {
//        switch (indexPath.section) {
//            case InvoiceCellTitle: {
//                InvoiceTitleTableViewCell *titleCell;
//                titleCell = [tableView
//                             dequeueReusableCellWithIdentifier:
//                                @"InvoiceTitleTableViewCell"];
//                cell = titleCell;
//                break;
//            }
//            case InvoiceCellContent: {
//                InvoiceContentTableViewCell *invoiceContentCell;
//                invoiceContentCell = [tableView
//                    dequeueReusableCellWithIdentifier:
//                        @"InvoiceContentTableViewCell"];
//                InvoiceContent *invoiceContent;
//                NSInteger invoiceContentIndex;
//                invoiceContentIndex = indexPath.row - 1;
//                invoiceContent = [self.cart.invoice.contents
//                                  objectAtIndex:invoiceContentIndex];
//                invoiceContentCell.invoiceContent = invoiceContent;
//                cell = invoiceContentCell;
//                
//                break;
//            }
//            default:
//                break;
//        }
//    }
//    
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
