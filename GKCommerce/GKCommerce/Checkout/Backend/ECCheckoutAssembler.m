//
//  ECCheckoutAssembler.m
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECCheckoutAssembler.h"

@implementation ECCheckoutAssembler

- (ShippingMethod *)shippingWithJSON:(NSDictionary *)JSON
{
    ShippingMethod *shipping = [[ShippingMethod alloc] init];
    shipping.shippingID = [[JSON objectForKey:@"shipping_id"] integerValue];
    shipping.code = [JSON objectForKey:@"shipping_code"];
    shipping.name = [JSON objectForKey:@"shipping_name"];
    shipping.cashOnDelivery = [[JSON objectForKey:@"support_cod"] intValue] == 0
    ? NO : YES;
    shipping.freight = [[NSDecimalNumber alloc]
                        initWithDecimal:[[JSON objectForKey:@"shipping_fee"] decimalValue]];
    
    return shipping;
}

- (NSArray *)shippingsWithJSON:(NSArray *)JSON
{
    NSMutableArray *shippings = [[NSMutableArray alloc] init];
    for (NSDictionary *shippingJSON in JSON)
        [shippings addObject:[self shippingWithJSON:shippingJSON]];
    return shippings;
}

- (PaymentType)paymentTypeWithCode:(NSString *)code
{
    // TODO: 只有部份支付方式
    PaymentType type;
    if ([@"balance" isEqualToString:code])
        type = PaymentTypeUserBalance;
    else if ([@"cod" isEqualToString:code])
        type = PaymentTypeCashOnDelivery;
    else if ([@"alipay" isEqualToString:code])
        type = PaymentTypeAlipay;
    
    return type;
}

- (Payment *)paymentWithJSON:(NSDictionary *)paymentJSON
{
    NSString *code = [paymentJSON objectForKey:@"pay_code"];
    PaymentType type = [self paymentTypeWithCode:code];
    Payment *payment;
    if (PaymentTypeUserBalance == type) {
        NSDecimalNumber *amount;
        //        amount = [[NSDecimalNumber alloc] initWithString:[paymentJSON]]
        payment = [[PaymentBalance alloc] initWithAmountOfMoney:amount];
    } else
        payment = [[Payment alloc] init];
    
    payment.paymentID = [[paymentJSON objectForKey:@"pay_id"] integerValue];
    payment.code = code;
    payment.name = [paymentJSON objectForKey:@"pay_name"];
    payment.cashOnDelivery = [[paymentJSON objectForKey:@"id_cod"] intValue]
        == 0 ? NO : YES;
    
    return payment;
}

- (NSArray *)paymentsWithJSON:(NSArray *)paymentsJSON
{
    NSMutableArray *payments = [[NSMutableArray alloc] init];
    for (NSDictionary *paymentJSON in paymentsJSON)
        [payments addObject:[self paymentWithJSON:paymentJSON]];
    
    return payments;
}

- (InvoiceContent *)invoiceContentWithJSON:(NSDictionary *)invoiceContentJSON
{
    InvoiceContent *content = [[InvoiceContent alloc] init];
    content.invoiceContentID = [[invoiceContentJSON objectForKey:@"id"]
                                integerValue];
    content.name = [invoiceContentJSON objectForKey:@"value"];
    return content;
}

- (Invoice *)invoiceWithJSON:(NSArray *)invoiceJSON;
{
    NSMutableArray *invoices = [[NSMutableArray alloc] init];
    for (NSDictionary *invoiceContentJSON in invoiceJSON)
        [invoices addObject:[self invoiceContentWithJSON:invoiceContentJSON]];
    
    Invoice *invoice = [[Invoice alloc] init];
    invoice.contents = invoices;
    return invoice;
}

@end
