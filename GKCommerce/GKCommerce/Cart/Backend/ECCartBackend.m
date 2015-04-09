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

- (void)requestCartWithUser:(User *)user
{
    DDLogVerbose(@"CartBackend 请求购物车数据。");
    NSDictionary *parameters;
    NSString *userID;
    
    userID = [NSString stringWithFormat:@"%d", user.userID];
    
    parameters = @{ @"session[uid]": userID,
                    @"session[sid]": user.sessionID };
    
    [self.manager
     POST:[NSString stringWithFormat:@"%@/cart/list", self.config.backendURL]
     parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestCartWithUser:user didResponse:responseObject error:nil];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self requestCartWithUser:user didResponse:nil error:error];
     }];
}

- (void)requestCartWithUser:(User *)user didResponse:(id)responseObject
                      error:(NSError *)anError
{
    NSError *error;
    if (nil == anError)
        error = [self.assembler error:responseObject];
    
    Cart *cart = [self.assembler cartWithJSON:responseObject user:user];
    
    SEL selector = @selector(cartBackend:didReceiveCart:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate cartBackend:self didReceiveCart:cart error:error];
}

- (void)requestAddItem:(CartItem *)item
{
    NSString *userID, *productID, *quantity;
    NSDictionary *parameters;
    GKUser *user = item.list.cart.user;
    userID     = [NSString stringWithFormat:@"%d", user.userID];
    productID  = [NSString stringWithFormat:@"%d", item.product.productID];
    quantity   = [NSString stringWithFormat:@"%d", item.quantity];
    parameters = @{ @"session[uid]": userID,
                    @"session[sid]": user.sessionID,
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
    
    DDLogVerbose(@"商品 %@ 成功加入购物车。", item.product.name);
    
    SEL selector = @selector(cartBackend:didAddItem:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate cartBackend:(id<CartBackend>)self didAddItem:item
                             error:error];
}

- (void)requestUpdateItem:(CartItem *)item oldQuantity:(NSInteger)anOldQuantity
{
    NSString *userID, *itemID, *quantity;
    NSDictionary *parameters;
    
    GKUser *user = item.list.cart.user;
    userID = [NSString stringWithFormat:@"%d", user.userID];
    itemID = [NSString stringWithFormat:@"%d", item.itemID];
    quantity = [NSString stringWithFormat:@"%d", item.quantity];
    parameters = @{ @"session[uid]": userID,
                    @"session[sid]": user.sessionID,
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
    
    // TODO: 没有创建CartItem对象
    
    SEL selector = @selector(cartBackend:didUpdateItem:oldQuantity:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate cartBackend:self didUpdateItem:item
                       oldQuantity:anOldQuantity error:error];
}

- (void)requestRemoveItem:(CartItem *)item
{
    NSString *userID, *itemID;
    NSDictionary *parameters;
    GKUser *user = item.list.cart.user;
    userID = [NSString stringWithFormat:@"%d", user.userID];
    itemID = [NSString stringWithFormat:@"%d", item.itemID];
    parameters = @{ @"session[uid]": userID,
                    @"session[sid]": user.sessionID,
                    @"rec_id": itemID };
    [self.manager
     POST:[NSString stringWithFormat:@"%@/cart/delete", self.config.backendURL]
     parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestRemoveItem:item didResponse:responseObject error:nil];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self requestRemoveItem:item didResponse:nil error:error];
     }];
}

- (void)requestRemoveItem:(CartItem *)item didResponse:(id)responseObject
                    error:(NSError *)anError
{
    NSError *error;
    if (nil == anError)
        error = [self.assembler error:responseObject];
    
    SEL selector = @selector(cartBackend:didRemoveItem:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate cartBackend:self didRemoveItem:item error:error];
}
@end
