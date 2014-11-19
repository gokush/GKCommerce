//
//  UITableView+Extension.m
//  GKCommerce
//
//  Created by 小悟空 on 11/19/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (UITableViewExtension)

- (void)tableViewCell:(UITableViewCell *)cell
setSeparatorForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count = [self numberOfRowsInSection:indexPath.section];
    SeparatorOption *bottom;
    bottom = [SeparatorOption optionWithColor:nil
                                  onDirection:SeparatorDirectionBottom
                                        width:0 indent:15.0f];
    
    if (0 == indexPath.row) {
        SeparatorOption *top;
        top = [SeparatorOption optionWithDirection:SeparatorDirectionTop];
        if (count - 1 == indexPath.row)
            bottom.indent = 0;
        [cell setSeparatorWithOption:top];
    } else if (count - 1 == indexPath.row) {
        bottom.indent = 0;
    }
    
   [cell setSeparatorWithOption:bottom];
}
@end