//
//  ECCheckoutBackend.h
//  GKCommerce
//
//  Created by 小悟空 on 12/15/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "Backend.h"
#import "CheckoutBackend.h"
#import "ECCheckoutAssembler.h"

@class ECCheckoutBackend;
@protocol ECCheckoutBackendDelegate <CheckoutBackendDelegate>

- (void)ecCheckoutBackend:(ECCheckoutBackend *)anECCheckoutBackend
         didReceiveResult:(NSMutableDictionary *)result;
@end

@interface ECCheckoutBackend : Backend <CheckoutBackend>

@property (strong, nonatomic) id<ECCheckoutBackendDelegate> delegate;
@property (strong, nonatomic) ECCheckoutAssembler *assembler;
- (void)requestCheckout:(Cart *)cart;
- (void)requestValidateCheckout:(Cart *)cart;
@end
