//
//  CartItemTableViewCell.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-4.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartItem.h"
#import "UIBindableTableViewCell.h"
#import "GKToggleButton.h"

@class CartItemTableViewCell;

@protocol CartItemTableViewCellDelegate <NSObject>

@optional

- (void)didCartItemBuy:(CartItem *)item;
- (void)didCartItemDrop:(CartItem *)item;
- (void)cartItemTableViewCell:(CartItemTableViewCell *)cell
                    didSelect:(BOOL)selected;
- (void)cartItem:(CartItem *) item didTapPhoto:(UIButton *)photo;

@end

@interface CartItemTableViewCell : UITableViewCell
<UIBindableTableViewCell, GKToggleButtonDelegate>

@property (nonatomic, strong) id<CartItemTableViewCellDelegate> delegate;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) IBOutlet GKToggleButton *select;
@property (nonatomic, strong) IBOutlet UILabel *name;
@property (nonatomic, strong) IBOutlet UITextField *quantity;
@property (nonatomic, strong) IBOutlet UIButton *photo;
@property (nonatomic, strong) IBOutlet UILabel *marketPrice;
@property (nonatomic, strong) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) CartItem *item;

- (void)bind;
- (void)unbind;
- (IBAction)increase:(id)sender;
- (IBAction)decrease:(id)sender;
- (IBAction)didTapPhoto:(id)sender;
@end
