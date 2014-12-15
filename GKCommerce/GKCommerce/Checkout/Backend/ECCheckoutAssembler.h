//
//  ECCheckoutAssembler.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECBackendAssembler.h"

@interface ECCheckoutAssembler : ECBackendAssembler

- (ShippingMethod *)shippingWithJSON:(NSDictionary *)JSON;
- (NSArray *)shippingsWithJSON:(NSArray *)JSON;
- (Payment *)paymentWithJSON:(NSDictionary *)paymentJSON;
- (NSArray *)paymentsWithJSON:(NSArray *)paymentsJSON;
- (InvoiceContent *)invoiceContentWithJSON:(NSDictionary *)invoiceContentJSON;
- (Invoice *)invoiceWithJSON:(NSArray *)invoiceJSON;
@end
