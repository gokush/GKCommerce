//
//  FeatureTableViewCell.h
//  WKCommerce
//
//  Created by 小悟空 on 14-10-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FeatureTableViewCell;

@protocol FeatureTableViewCellDelegate <NSObject>

- (void)featureTableViewCell:(FeatureTableViewCell *)featureTableViewCell
            didSelectProduct:(Product *)product;
@end

@interface FeatureTableViewCell : UITableViewCell

@property (strong, nonatomic) id<FeatureTableViewCellDelegate> delegate;
@end
