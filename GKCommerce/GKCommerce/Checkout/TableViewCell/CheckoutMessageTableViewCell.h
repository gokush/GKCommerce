//
//  CheckoutMessageTableViewCell.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-23.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>

// TODO: miss custom TextFieldDelegate
@interface CheckoutMessageTableViewCell : UITableViewCell
<UITextFieldDelegate>

@property (strong, nonatomic) id delegate;
@end
