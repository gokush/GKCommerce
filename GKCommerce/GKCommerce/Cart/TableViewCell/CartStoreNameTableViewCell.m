//
//  CartStoreNameTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 12/3/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "CartStoreNameTableViewCell.h"

@interface CartStoreNameTableViewCell()

@property (strong, nonatomic) SeparatorOption *bottomBorder;
@end

@implementation CartStoreNameTableViewCell
{
    BOOL skipUpdateSelect;
}

- (void)awakeFromNib {
    skipUpdateSelect = NO;
    SeparatorOption *option;
    option = [SeparatorOption optionWithColor:UIColorFromRGB(0xdfdfdf)
                                  onDirection:SeparatorDirectionTop];
    [self setSeparatorWithOption:option];
    
    option.direction = SeparatorDirectionBottom;
    [self setSeparatorWithOption:option];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bind
{
    @weakify(self)
    [RACObserve(self, list.selected) subscribeNext:^(NSMutableArray *selected) {
        @strongify(self)
        if (skipUpdateSelect)
            return;
        
        BOOL didSelectAllItems = selected.count == self.list.items.count;
        if (self.select.on != didSelectAllItems)
            self.select.on = didSelectAllItems;
    }];
}

- (void)unbind
{
    
}

- (void)toggleButton:(GKToggleButton *)aToggleButton didSwitch:(BOOL)onOrOff
{
    skipUpdateSelect = YES;
    CartItemList *list = self.list;
    [list selectAllItems:onOrOff];
    skipUpdateSelect = NO;
}

- (IBAction)didTapEdit:(id)sender
{
    self.model.editable = !self.model.editable;
    SEL selector = @selector(cartStoreNameTableViewCell:didTapEdit:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate cartStoreNameTableViewCell:self didTapEdit:sender];
}

@end
