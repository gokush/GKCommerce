//
//  CartViewController.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-7-29.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "CartViewController.h"
#import "ProductDetailViewController.h"
#import "UIBindableTableViewCell.h"
#import "Dependency.h"

@interface CartViewController ()
{
    CartEmptyView *cartEmptyView;
    UINavigationController *_loginNavigationController;
    BOOL didSelecteAllBecauseObserver;
}

@end

@implementation CartViewController

- (void)setup
{
    didSelecteAllBecauseObserver = NO;
    [self addObserver:self forKeyPath:@"user" options:0 context:nil];
    [self addObserver:self forKeyPath:@"cart"
              options:NSKeyValueObservingOptionPrior context:nil];
    
    self.user = [[App shared] currentUser];
    self.service = [[Dependency shared] cartService];
    self.service.delegate = self;
    
    if ([self.user authorized])
        [self.service fetch:self.user.cart];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = @"购物车";
    
    // setup table view
    for (NSString *identifier in @[@"CartItemOverviewTableViewCell",
                                   @"CartItemTableViewCell"])
        [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil]
             forCellReuseIdentifier:identifier];

    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UIColorFromRGB(0xf3f3f3);

    UIBarButtonItem *right;
    right = [[UIBarButtonItem alloc]
             initWithTitle:@"移除" style:UIBarButtonItemStylePlain
             target:self action:@selector(rightBarButtonClick:)];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    if ([@"cart" isEqualToString:keyPath]) {
        if (self.cart && change[NSKeyValueChangeNotificationIsPriorKey]) {
            [self.cart removeObserver:self forKeyPath:@"items"];
            [self.cart removeObserver:self forKeyPath:@"price"];
        } else if (self.cart &&
                   !change[NSKeyValueChangeNotificationIsPriorKey]) {
            [self.cart addObserver:self forKeyPath:@"price" options:0
                           context:nil];
            [self.cart addObserver:self forKeyPath:@"items" options:0
                           context:nil];
            [self.cart addObserver:self forKeyPath:@"selectAll"
                           options:NSKeyValueObservingOptionInitial
                           context:nil];
        }
        if (nil == self.cart || [self.cart empty])
            return;
        
        
        [self emptyCart];
        [self renderSelectAll];
        [self.tableView reloadData];
    } else if ([@"price" isEqualToString:keyPath]) {
        [self renderOverview];
    } else if ([@"items" isEqualToString:keyPath]) {
        [self emptyCart];
        [self renderSelectAll];
        [self.tableView reloadData];
    } else if ([@"user" isEqualToString:keyPath]) {
        self.cart = self.user.cart;
        
    } else if ([@"selectAll" isEqualToString:keyPath])
        [self renderSelectAll];
}

- (void)renderSelectAll
{
    if (didSelecteAllBecauseObserver) {
        didSelecteAllBecauseObserver = NO;
        return;
    }
    self.selectAll.on = self.user.cart.selectAll;
}

- (void)emptyCart
{
    if (nil == cartEmptyView) {
        cartEmptyView = [[[NSBundle mainBundle]
                          loadNibNamed:@"CartEmptyView" owner:nil options:nil]
                         lastObject];
        cartEmptyView.delegate = self;
    }
    
    if ([self.user authorized]) {
        cartEmptyView.authenticated = YES;
        
        if (self.user.cart.empty) {
            self.navigationItem.rightBarButtonItem = nil;
            [self.view addSubview:cartEmptyView];
        } else {
            [cartEmptyView removeFromSuperview];
        }
    } else {
        cartEmptyView.authenticated = NO;
        [self.view addSubview:cartEmptyView];
    }
    
}

- (void)renderOverview
{
    self.totalPrice.text = [NSString stringWithFormat:@"合计:￥%.2f",
            self.cart.price.floatValue];
}

#pragma mark - CartServiceDelegate

- (void)cartService:(id<CartService>)aCartService cart:(Cart *)aCart
              error:(NSError *)anError
{
    
}

- (void)cartService:(id<CartService>)aCartService didUpdateItem:(CartItem *)item
        oldQuantity:(NSInteger)anOldQuantity error:(NSError *)anError
{
    if (anError)
        [self.view showHUD:anError.localizedDescription afterDelay:2];
}

#pragma mark - Events
- (IBAction)didTapCheckout:(id)sender
{
    Cart *cart = [[Cart alloc] initWithUser:self.user];
    cart.freight = self.user.cart.freight;
    cart.freeShipping = self.user.cart.freeShipping;

    [cart addItems:[self.user.cart want]];
    [cart calculatePrice];
}

- (void)didNavigationItemLeftButtonTap:(id)sender
{
    
}

- (void)didNavigationItemRightButtonTap:(id)sender
{
    [self.service removeItems:self.cart.items];
}

- (void)didCartItemBuy:(CartItem *)item
{
    NSInteger quantity = item.quantity;
    [item buy];
    
    [self.service updateItem:item oldQuantity:quantity];
}

- (void)didCartItemDrop:(CartItem *)item
{
    NSInteger quantity = item.quantity;
    if (quantity > 1) {
        [item drop];
        [self.service updateItem:item oldQuantity:quantity];
    }
}

- (void)rightBarButtonClick:(id)sender
{
    if (self.user.cart.selected.count > 0) {
        [self.service removeItems:self.cart.selected];
    }
}

- (void)didSelectAll:(id)sender
{
    didSelecteAllBecauseObserver = YES;
    BOOL select = self.selectAll.on;
    self.cart.selectAll = !select;
}

#pragma mark- CartEmptyViewDelegate


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 127;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (nil != self.cart.items && self.cart.items > 0) {
        return self.cart.items.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CartItemTableViewCell *cell;
    cell = [tableView
            dequeueReusableCellWithIdentifier:@"CartItemTableViewCell"];
    cell.delegate = self;
    cell.item = [self.cart.items objectAtIndex:indexPath.row];
    [cell bind];
    return cell;
}

- (void)tableView:(UITableView *)tableView
didEndDisplayingCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<UIBindableTableViewCell> bindable = (id<UIBindableTableViewCell>)cell;
    [bindable unbind];
}

- (void)cartItemPhotoClicked:(CartItem*)item
{
    ProductDetailViewController *viewController;
    viewController = [[ProductDetailViewController alloc]
                      initWithProductID:item.product.productID
                      user:self.user];
    [self.navigationController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
