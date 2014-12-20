//
//  InvoiceTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/4.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "CheckoutInvoiceTableViewCell.h"

@implementation CheckoutInvoiceTableViewCell

- (void)bind
{
    [self.cart addObserver:self forKeyPath:@"invoice.content"
                   options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unbind
{
    [self.cart removeObserver:self forKeyPath:@"invoice.content"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    static NSString *needInvoice;
    needInvoice = @"%@\n%@";
    BOOL invoiceContent = NO;
    invoiceContent = [@"invoice.content" isEqualToString:keyPath];
    if (invoiceContent && self.cart.invoice.content) {
        self.descriptionLabel.text = [[NSString alloc]
                                      initWithFormat:needInvoice,
                                      self.cart.invoice.title,
                                      self.cart.invoice.content.name];
    } else if (invoiceContent && !self.cart.invoice.content) {
        self.descriptionLabel.text = @"不开发票";
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
