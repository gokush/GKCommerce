//
//  ECCartBackendAssembler.m
//  GKCommerce
//
//  Created by 小悟空 on 11/23/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECCartBackendAssembler.h"
#import "Store.h"
#import "Order.h"
#import "OrderItem.h"
#import "CartItemList.h"

@implementation ECCartBackendAssembler

- (id)init
{
    self = [super init];
    if (self) {
        self.productAssembler = [[ECProductBackendAssembler alloc] init];
    }
    return self;
}

- (Cart *)cartWithJSON:(NSDictionary *)JSON user:(User *)anUser
{
    Cart *cart;
    cart = [[Cart alloc] initWithUser:anUser];
    cart.itemsOfStore = [[NSMutableArray alloc] initWithCapacity:0];
    
    CartItemList *list = [[CartItemList alloc] init];
    [cart addList:list];

    NSArray *itemsJSON = [JSON valueForKeyPath:@"data.goods_list"];
    
    [list addItems:[self cartItems:itemsJSON]];
    list.price = [self totalPrice:[JSON valueForKeyPath:@"data.total"]];
    
    Store *store = [[Store alloc] init];
    list.store = store;
    
    return cart;
}

- (NSDecimalNumber *)totalPrice:(NSDictionary *)JSON
{
    NSString *price;
    price = [self digitalWithString:[JSON objectForKey:@"goods_price"]];
    return [[NSDecimalNumber alloc] initWithString:price];
}

- (NSArray *)cartItems:(NSArray *)itemsJSON
{
    NSMutableArray *items = [NSMutableArray array];
    for (NSDictionary *itemJSON in itemsJSON)
        [items addObject:[self cartItem:itemJSON]];
    return items;
}

- (CartItem *)cartItem:(NSDictionary *)itemJSON
{
    CartItem *item;
    NSInteger quantity;

    quantity = [[itemJSON objectForKey:@"goods_number"] integerValue];
    
    item = [[CartItem alloc] init];
    item.itemID = [[itemJSON objectForKey:@"rec_id"] intValue];
    item.product = [self productWithCartItemJSON:itemJSON];
    item.quantity = quantity;
    NSString *totalPrice =
        [self digitalWithString:[itemJSON objectForKey:@"subtotal"]];
    item.totalPrice = [NSDecimalNumber decimalNumberWithString:totalPrice];
    return item;
}

- (Product *)productWithCartItemJSON:(NSDictionary *)productJSON
{
    NSString *price, *marketPrice;
    price = [self
             digitalWithString:[productJSON objectForKey:@"goods_price"]];
    marketPrice = [self
                   digitalWithString:[productJSON objectForKey:@"market_price"]];
    Product *product = [[Product alloc] init];
    
    product.productID = [[productJSON objectForKey:@"goods_id"] intValue];
    product.name = [productJSON objectForKey:@"goods_name"];
    product.price = [NSDecimalNumber decimalNumberWithString:price];
    product.marketPrice = [NSDecimalNumber decimalNumberWithString:marketPrice];
    
    product.stocks = -1;
    
    ProductImageURL *productImage;
    productImage = [self.productAssembler productImageURL:[productJSON objectForKey:@"img"]];
    product.image = productImage;
    
    return product;
}
@end
