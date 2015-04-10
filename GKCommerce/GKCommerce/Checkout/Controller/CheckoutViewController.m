//
//  CheckoutViewController.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-23.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CheckoutViewController.h"
#import "CheckoutInputTableViewCell.h"
#import "CheckoutInvoiceTableViewCell.h"
#import "CheckoutShippingTableViewCell.h"
#import "CartItemTableViewCell.h"
#import "CartItemOverviewTableViewCell.h"
#import "CheckoutPaymentTableViewCell.h"
#import "CheckoutInvoiceTableViewCell.h"
#import "CheckoutAddressTableViewCell.h"
#import "InvoiceViewController.h"
#import "PaymentSuccessViewController.h"
#import "AlipayUtility.h"
#import "AlipayResponse.h"
#import "OrderDetailViewController.h"
#import "Alipay.h"
//#import "PaymentViewController.h"
#import "ShippingViewController.h"
#import "Payment.h"
#import <QuartzCore/QuartzCore.h>
#import "CheckoutChoiceAddressController.h"

#define CELL_NAME @[@"CheckoutAddressTableViewCell", \
    @"CheckoutStoreNameTableViewCell", @"CheckoutCartOverviewTableViewCell", \
    @"CheckoutMessageTableViewCell", @"CheckoutInputTableViewCell", \
    @"CartItemTableViewCell", @"CartItemOverviewTableViewCell", \
    @"CheckoutShippingTableViewCell", @"CheckoutPaymentTableViewCell", \
    @"CheckoutInvoiceTableViewCell", @"CheckoutProductTableViewCell", \
    @"CartOverviewTableViewCell", @"CheckoutAddressTableViewCell"]

typedef enum {
    CellCargoDelivery,
    CellProduct,
    CellCartOverview,
    CellMessage
} CheckoutCell;

typedef enum {
    CellAddress
} CheckoutAddressSection;

typedef enum {
    SectionAddress,
    SectionCart,
    SectionShippingAndPaymentAndInvoice,
    SectionMessage
} CheckoutSection;

typedef enum {
    CellShippiing,
    CellPayment,
    CellInvoice
} SectionShippingAndPaymentAndInvoiceCell;

@interface CheckoutViewController ()
{
    NSArray *heightOfCells;
    NSArray *numberOfRowsInSection;
    NSArray *labels;
    NSArray *namesOfObject;
    CheckoutInputTableViewCell *messageCell;
    BOOL userAccountLoaded;
    NSInteger numberOfStoreAdditionCell;
}

@property (strong, nonatomic) Alipay *alipay;

@end

@implementation CheckoutViewController
objection_requires_sel(@selector(service))

- (id)initWithUser:(GKUser *)user cart:(Cart *)cart
{
    self = [self initWithNibName:@"CheckoutView" bundle:nil];
    if (self) {
        self.user = user;
        self.cart = cart;
        [self setup];
    }
    return self;
}

- (void)setup
{
    numberOfStoreAdditionCell = 3;
    [self.cart addObserver:self
                forKeyPath:@"products"
                   options:NSKeyValueObservingOptionNew|
                           NSKeyValueObservingOptionPrior
                   context:nil];
    
    numberOfRowsInSection = @[@3, @1, @1, @1, @1];
    
    labels = @[
        @[@"收货人", @"电话", @"收货地址"],
        @[@"收货方式"],
        @[@"发票"],
        @[],
        @[@"留言"]
    ];
    
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardWillShow:)
     name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardWillHide:)
     name:UIKeyboardWillHideNotification object:nil];
    
    [self.cart addObserver:self forKeyPath:@"invoice"
                   options:NSKeyValueObservingOptionInitial context:nil];
    [self.cart addObserver:self forKeyPath:@"totalPrice"
                  options:NSKeyValueObservingOptionInitial context:nil];
    [self.cart addObserver:self forKeyPath:@"price" options:0 context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([@"products" isEqualToString:keyPath]) {
        [self fillData];
        [self.tableView reloadData];
    }
    
    if ([@"price" isEqualToString:keyPath] ||
        [@"totalPrice" isEqualToString:keyPath]) {
        [self fillData];
    }
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyBoardEndY = value.CGRectValue.origin.y;
    
    NSNumber *duration =
        [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve =
        [userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    UITapGestureRecognizer *recognizer;
    recognizer = [[UITapGestureRecognizer alloc]
                  initWithTarget:self
                  action:@selector(didTapCheckoutScreen:)];
    
    [self.view addGestureRecognizer:recognizer];
    
//    [UIView animateWithDuration:duration.doubleValue animations:^{
//        [UIView setAnimationBeginsFromCurrentState:YES];
//        [UIView setAnimationCurve:[curve intValue]];
//        
//        CGSize size = self.view.bounds.size;
//        self.view.center = CGPointMake(self.view.center.x,
//                                       keyBoardEndY - size.height/2.0);
//        
//    }];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    
    NSNumber *duration =
    [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve =
    [userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    [UIView animateWithDuration:duration.doubleValue animations:^{
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationCurve:[curve intValue]];
        
        CGSize size = self.view.bounds.size;
        self.view.center = CGPointMake(self.view.center.x, size.height / 2);
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"订单确认";
    
    UINib *nib;
    for (NSString *tableViewCellName in CELL_NAME) {
        nib = [UINib nibWithNibName:tableViewCellName bundle:nil];
        [self.tableView registerNib:nib
             forCellReuseIdentifier:tableViewCellName];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewWillAppear:animated];
}

- (void)fillData
{
    float totalPrice = self.cart.price.floatValue;
    self.totalPrice.text = [NSString stringWithFormat:@"￥%.2f", totalPrice];
    self.price.text = [NSString stringWithFormat:@"商品总价:￥%.2f",
       self.cart.price.floatValue];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 + self.cart.itemsOfStore.count;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    switch (section) {
        case SectionCart: {
            CartItemList *list;
            list = (CartItemList *)
                [self.cart.itemsOfStore objectAtIndex:section - 1];
            rows = list.items.count + numberOfStoreAdditionCell;
            break;
        }
        case SectionAddress:
            rows = 1;
            break;
        case SectionShippingAndPaymentAndInvoice:
            rows = 3;
            break;
        case SectionMessage:
            rows = 1;
            break;
        default:
            rows = (NSInteger)[numberOfRowsInSection objectAtIndex:section];
    }

    return rows;
}


- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    switch (indexPath.section) {
        case SectionAddress:
            height = [CheckoutAddressTableViewCell
                      heightWithAddress:self.user.address] + 50;
            break;
        case SectionCart: {
            CartItemList *list;
            list = [self.cart.itemsOfStore objectAtIndex:indexPath.section - 1];
            
            NSInteger lastIndex;
            BOOL first, last, shipping;
            first = 0 == indexPath.row;
            lastIndex = list.items.count + numberOfStoreAdditionCell - 1;
            last = lastIndex == indexPath.row;
            shipping = lastIndex - 1 == indexPath.row;
            
            if (first)
                return 45.0f;
            else if (last)
                return 36.0f;
            else if (shipping)
                return 44.0f;
            else
                return 84.0f;
            break;
        }
        case SectionShippingAndPaymentAndInvoice: {
            height = 44.0f;
            break;
        }
        case SectionMessage: {
            height = 39.0f;
            break;
        }
    }
    return height;
}

- (UITableViewCell *)addressTableViewCell:(NSIndexPath *)indexPath
{
    CheckoutAddressTableViewCell *cell;
    cell = [self.tableView
            dequeueReusableCellWithIdentifier:@"CheckoutAddressTableViewCell"];
    
    if (self.address == nil)
        self.address = self.user.address;
    
    cell.address = self.address;
    
    return cell;
}

- (UITableViewCell *)shippingAndPaymentAndInvoiceCell:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    SeparatorOption *normalOption, *indentOption;
    normalOption = [SeparatorOption
                    optionWithDirection:SeparatorDirectionBottom];
    indentOption = [SeparatorOption
                    optionWithColor:nil onDirection:SeparatorDirectionBottom
                    width:1.0f indent:12.0f];
    
    switch (indexPath.row) {
        case CellShippiing: {
            CheckoutShippingTableViewCell *shippingCell;
            shippingCell = [self.tableView dequeueReusableCellWithIdentifier:
                            @"CheckoutShippingTableViewCell"];
            shippingCell.cart = self.cart;
            [shippingCell bind];
            cell = shippingCell;
            break;
        }
        case CellPayment: {
            CheckoutPaymentTableViewCell *paymentCell;
            paymentCell = [self.tableView dequeueReusableCellWithIdentifier:
                           @"CheckoutPaymentTableViewCell"];
            paymentCell.cart = self.cart;
            [paymentCell bind];
            cell = paymentCell;
            break;
        }
        case CellInvoice: {
            CheckoutInvoiceTableViewCell *invoiceCell;
            invoiceCell = [self.tableView dequeueReusableCellWithIdentifier:
                           @"CheckoutInvoiceTableViewCell"];
            invoiceCell.cart = self.cart;
            [invoiceCell bind];
            cell = invoiceCell;
            break;
        }
        default:
            break;
    }
    
    return cell;
}

- (UITableViewCell *)invoiceTableViewCell
{
    CheckoutInvoiceTableViewCell *cell;
    cell = [self.tableView
        dequeueReusableCellWithIdentifier:@"CheckoutInvoiceTableViewCell"];
    return cell;
}

- (UITableViewCell *)checkoutProductTableViewCell:(NSIndexPath *)indexPath
{
    NSString *identifier;
    UITableViewCell *cell;
    CartItemList *list;
    
    list = [self.cart.itemsOfStore objectAtIndex:indexPath.section - 1];
    
    NSInteger lastIndex;
    BOOL first, last, shipping;
    first = 0 == indexPath.row;
    lastIndex = list.items.count + numberOfStoreAdditionCell - 1;
    last = lastIndex == indexPath.row;
    shipping = lastIndex - 1 == indexPath.row;
    
    DDLogVerbose(@"结算视图控制器单元格工厂方法 第%d行", (int)indexPath.row);
    
    // CartStoreNameTableViewCell
    if (first) {
        identifier = @"CheckoutStoreNameTableViewCell";
        cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
        
        ((CartStoreNameTableViewCell *)cell).list = list;
    } else if (last) {
        // CartItemOverviewTableViewCell
        identifier = @"CartItemOverviewTableViewCell";
        cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
        ((CartItemOverviewTableViewCell *) cell).list = list;
    } else if (shipping) {
        // CheckoutShippingTableViewCell
        identifier = @"CheckoutShippingTableViewCell";
        cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
        ((CheckoutShippingTableViewCell *)cell).cart = self.cart;
        
    } else {
        // CartItemTableViewCell
        identifier = @"CheckoutProductTableViewCell";
        cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
        
        CheckoutProductTableViewCell *product;
        product = (CheckoutProductTableViewCell *)cell;
        NSInteger itemIndex = indexPath.row - 1;
        product.item = (CartItem *)[list itemAtIndex:itemIndex];
        product.delegate = self;
    }

    return cell;
}

- (UITableViewCell *)messageTableViewCell
{
    messageCell = [self.tableView
            dequeueReusableCellWithIdentifier:@"CheckoutInputTableViewCell"];
    messageCell.label.text = @"留言";
    messageCell.input.text = @"";
    messageCell.input.placeholder = @"留言";
    messageCell.input.enabled = YES;
    return messageCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    switch (indexPath.section) {
        case SectionAddress:
            cell = [self addressTableViewCell:indexPath];
            break;
        case SectionCart: {
            cell = [self checkoutProductTableViewCell:indexPath];
            break;
        }
        case SectionShippingAndPaymentAndInvoice: {
            cell = [self shippingAndPaymentAndInvoiceCell:indexPath];
            break;
        }
        case SectionMessage: {
            cell = [self messageTableViewCell];
            break;
        }
        default:
            break;
    }
    
    if (nil == cell)
        DDLogError(@"空的单元格行%d段%d在结算视图控制器", (int)indexPath.row,
                   (int)indexPath.section);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
didEndDisplayingCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell conformsToProtocol:@protocol(UIBindableTableViewCell)]) {
        id<UIBindableTableViewCell> bindable = (id<UIBindableTableViewCell>)cell;
        [bindable unbind];
    }
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case SectionAddress:
            switch (indexPath.row) {
                case CellAddress:
                    [self choiceAddresses];
                    break;
                    
                default:
                    break;
            }
        case SectionShippingAndPaymentAndInvoice:
            switch (indexPath.row) {
                case CellShippiing: {
                    break;
                }
                case CellPayment: {
                    break;
                }
                case CellInvoice: {
                    viewController = [[InvoiceViewController alloc]
                                        initWithCart:self.cart];
                }
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    if (viewController)
        [self.navigationController pushViewController:viewController
                                             animated:YES];
}

- (void)choiceAddresses
{
    CheckoutChoiceAddressController *controller;
    controller = [[CheckoutChoiceAddressController alloc] init];
    RAC(self, address) = controller.chosen;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - BackendDelegate

- (void)didReceiveCart:(Cart *)cart
{
    [self fillData];
    [self.tableView reloadData];
}

- (void)didReceiveUserAccount:(GKUser *)user
{
    userAccountLoaded = YES;
}

- (void)didFinishCartUpdate:(CartItem *)cartItem
{
    [self checkOrder];
}

- (void)didFinishCartCreate:(CartItem *)cartItem
                   quantity:(NSInteger)aQuantity
{
    [self checkOrder];
}

- (void)checkOrder
{
    if (self.cart.price.floatValue == 0) {
    } else {
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
}

- (IBAction)checkoutDidTap:(id)sender
{
    @weakify(self);
    [[self.service checkout:self.cart] subscribeNext:^(Order *order) {
        @strongify(self);
        PaymentSuccessViewController *controller;
        controller = [[PaymentSuccessViewController alloc]
                      initWithOrder:order andUser:self.user];
        [self.navigationController pushViewController:controller animated:YES];
    }];
}

- (void)didTapCheckoutScreen:(id)sender
{
    if (self.focusTextField) {
        [self.focusTextField resignFirstResponder];
    }
    
    UITapGestureRecognizer *recognizer = (UITapGestureRecognizer *)sender;
    [self.view removeGestureRecognizer:recognizer];
}


- (void)textField:(UITextField *)aTextField didGainFocus:(BOOL)isGain
{
    if (isGain) {
        self.focusTextField = aTextField;
    }
}

# pragma mark - CartItemTableViewCellDelegate
- (void)cartItem:(CartItem *)item didTapPhoto:(UIButton *)photo
{
    
}

- (void)cartItemTableViewCell:(CartItemTableViewCell *)cell
                    didSelect:(BOOL)selected
{
    
}

#pragma mark - CheckoutProductTableViewController
- (void)checkoutProductTableViewCell:(CheckoutProductTableViewCell *)cell
                       didTapProduct:(Product *)product
{
    DDLogVerbose(@"在结算视力选中商品 %@", product.name);
}
@end
