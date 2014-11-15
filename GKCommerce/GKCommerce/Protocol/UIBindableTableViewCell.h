//
//  UIBindableTableViewCell.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/3.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIBindableTableViewCell <NSObject>

- (void)bind;
- (void)unbind;
@end
