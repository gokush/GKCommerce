//
//  CartStoreNameTableViewCell.h
//  GKCommerce
//
//  Created by 小悟空 on 12/3/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartViewModel.h"

@class CartStoreNameTableViewCell;

@protocol CartStoreNameTableViewCellDelegate <NSObject>

- (void)cartStoreNameTableViewCell:(CartStoreNameTableViewCell *)cell
                        didTapEdit:(UIButton *)edit;

@end

@interface CartStoreNameTableViewCell : UITableViewCell
<UIBindableTableViewCell, GKToggleButtonDelegate>

@property (strong, nonatomic) IBOutlet GKToggleButton *select;
@property (strong, nonatomic) IBOutlet UIButton *editButton;
@property (strong, nonatomic) CartItemList *list;
@property (strong, nonatomic) CartItemListViewModel *model;
@property (strong, nonatomic) id<CartStoreNameTableViewCellDelegate> delegate;
- (IBAction)didTapEdit:(id)sender;
@end
