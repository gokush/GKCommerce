//
//  ECCartBackend.m
//  GKCommerce
//
//  Created by 小悟空 on 11/23/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECCartBackend.h"

@implementation ECCartBackend

- (id)init
{
    self = [super init];
    if (self) {
        self.assembler = [[ECCartBackendAssembler alloc] init];
    }
    return self;
}

- (void)requestCart:(Cart *)cart
{
    NSDictionary *parameters;
    NSString *userID;
    
    userID = [NSString stringWithFormat:@"%d", cart.user.userID];
    
    parameters = @{ @"session[uid]": userID,
                    @"session[sid]": cart.user.sessionID };
    
    [self.manager
     POST:[NSString stringWithFormat:@"%@/cart/list", self.config.backendURL]
     parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestCart:cart didResponse:responseObject
                                 error:nil];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self requestCart:cart didResponse:nil error:error];
     }];
}

- (void)requestCart:(Cart *)cart didResponse:(id)responseObject
              error:(NSError *)anError
{
    NSError *error;
    if (nil == anError)
        error = [self.assembler error:responseObject];
    [self.assembler cart:[responseObject objectForKey:@"data"] toCart:cart];
    
    SEL selector = @selector(cartBackend:didReceiveCart:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate cartBackend:self didReceiveCart:cart error:error];
}

- (void)requestAddItem:(CartItem *)item
{
    NSString *userID, *productID, *quantity;
    NSDictionary *parameters;
    
    userID = [NSString stringWithFormat:@"%d", item.cart.user.userID];
    productID = [NSString stringWithFormat:@"%d", item.product.productID];
    quantity = [NSString stringWithFormat:@"%d", item.quantity];
    parameters = @{ @"session[uid]": userID,
                    @"session[sid]": item.cart.user.sessionID,
                    @"goods_id": productID,
                    @"number": quantity,
                    @"spec": @"" };
    [self.manager
     POST:[NSString stringWithFormat:@"%@/cart/create", self.config.backendURL]
     parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestAddItem:item didResponse:responseObject error:nil];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self requestAddItem:item didResponse:nil error:error];
     }];
}

- (void)requestAddItem:(CartItem *)item didResponse:(id)responseObject
              error:(NSError *)anError
{
    NSError *error;
    if (nil == anError)
        error = [self.assembler error:responseObject];
    
    SEL selector = @selector(cartBackend:didAddItem:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate cartBackend:(id<CartBackend>)self didAddItem:item
                             error:error];
}

- (void)requestUpdateItem:(CartItem *)item oldQuantity:(NSInteger)anOldQuantity
{
    NSString *userID, *itemID, *quantity;
    NSDictionary *parameters;
    
    userID = [NSString stringWithFormat:@"%d", item.cart.user.userID];
    itemID = [NSString stringWithFormat:@"%d", item.itemID];
    quantity = [NSString stringWithFormat:@"%d", item.quantity];
    parameters = @{ @"session[uid]": userID,
                    @"session[sid]": item.cart.user.sessionID,
                    @"rec_id": itemID,
                    @"new_number": quantity };
    [self.manager
     POST:[NSString stringWithFormat:@"%@/cart/update", self.config.backendURL]
     parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestUpdateItem:item oldQuantity:anOldQuantity
                     didResponse:responseObject error:nil];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self requestUpdateItem:item oldQuantity:anOldQuantity
                     didResponse:nil error:error];
     }];
}

- (void)requestUpdateItem:(CartItem *)item oldQuantity:(NSInteger)anOldQuantity
              didResponse:(id)responseObject error:(NSError *)anError
{
    NSError *error;
    if (nil == anError)
        error = [self.assembler error:responseObject];
    
    [self.assembler updateCart:item.cart
                         total:[responseObject objectForKey:@"data"]];
    
    SEL selector = @selector(cartBackend:didUpdateItem:oldQuantity:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate cartBackend:self didUpdateItem:item
                       oldQuantity:anOldQuantity error:error];
}

- (void)requestRemoveItem:(CartItem *)item
{
    
}
@end
