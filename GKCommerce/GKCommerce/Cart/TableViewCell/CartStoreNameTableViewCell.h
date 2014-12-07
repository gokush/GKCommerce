//
//  CartStoreNameTableViewCell.h
//  GKCommerce
//
//  Created by 小悟空 on 12/3/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartStoreNameTableViewCell : UITableViewCell
<UIBindableTableViewCell, GKToggleButtonDelegate>

@property (strong, nonatomic) CartItemList *list;
@property (strong, nonatomic) IBOutlet GKToggleButton *select;
@end
