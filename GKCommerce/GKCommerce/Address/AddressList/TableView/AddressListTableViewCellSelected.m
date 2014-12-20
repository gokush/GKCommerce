//
//  AddressTableViewCellSelected.m
//  GKCommerce
//
//  Created by 小悟空 on 11/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "AddressListTableViewCellSelected.h"

@implementation AddressListTableViewCellSelected

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.layer.cornerRadius = 5.0f;
    self.backgroundColor = [UIColor colorWithRed:0.0f green:0.46f blue:1.0f
                                           alpha:1.0f];
    return self;
}

- (void)setSelected:(BOOL)selected
{
    if (_selected != selected) {
        _selected = selected;
        
        self.hidden = !selected;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
