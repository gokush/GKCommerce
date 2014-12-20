//
//  CheckoutPaymentTableViewCell.m
//  GKCommerce
//
//  Created by 小悟空 on 14/11/3.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "CheckoutPaymentTableViewCell.h"

@implementation CheckoutPaymentTableViewCell

- (void)bind
{
    [self.cart addObserver:self forKeyPath:@"payment"
                   options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)unbind
{
    [self.cart removeObserver:self forKeyPath:@"payment"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    BOOL balance = NO, payments = NO;
    
    payments = [@"payment" isEqualToString:keyPath] && self.cart.payment;
    balance = payments && self.cart.payment.type == PaymentTypeUserBalance;
    
    if (balance) {
        PaymentBalance *paymentBalance = (PaymentBalance *)self.cart.payment;
        self.nameLabel.text = [[NSString alloc] initWithFormat:@"%@ (%.2f)",
                               paymentBalance.name,
                               paymentBalance.amountOfMoney.floatValue];
    } else if (payments) {
        self.nameLabel.text = self.cart.payment.name;
    }
}

@end
