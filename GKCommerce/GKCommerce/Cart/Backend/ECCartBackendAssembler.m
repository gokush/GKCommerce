//
//  ECCartBackendAssembler.m
//  GKCommerce
//
//  Created by 小悟空 on 11/23/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECCartBackendAssembler.h"

@implementation ECCartBackendAssembler

- (id)init
{
    self = [super init];
    if (self) {
        self.productAssembler = [[ECProductBackendAssembler alloc] init];
    }
    return self;
}

- (Cart *)cart:(NSDictionary *)JSON toCart:(Cart *)cart
{
    float freeShipping, freight;
    
    freeShipping = [[JSON objectForKey:@"free_send"] floatValue];
    freight = [[JSON objectForKey:@"deliver_cost"] floatValue];
    
    if (freight > 0)
        cart.freight = [[NSDecimalNumber alloc] initWithFloat:freight];
    if (freeShipping > 0)
        cart.freeShipping = [[NSDecimalNumber alloc]
                             initWithFloat:freeShipping];
    [self updateCart:cart total:[JSON objectForKey:@"total"]];
    NSArray *itemsJSON = [JSON objectForKey:@"goods_list"];
    [self createOrUpdateCartProduct:itemsJSON toCart:cart];
    return cart;
}

- (void)updateCart:(Cart *)cart total:(NSDictionary *)JSON
{
    NSString *price;
    price = [self digitalWithString:[JSON objectForKey:@"goods_price"]];
    cart.price = [[NSDecimalNumber alloc] initWithString:price];
}

- (BOOL)createOrUpdateCartProduct:(NSArray *)itemsJSON
                           toCart:(Cart *)cart
{
    NSMutableArray *cartProducts;
    CartItem *item;
    NSInteger itemID;
    NSInteger quantity;
    cartProducts = [[NSMutableArray alloc]
                    initWithCapacity:itemsJSON.count];
    
    int count = 0;
    for (NSDictionary *itemJSON in itemsJSON) {
        itemID = [[itemJSON objectForKey:@"goods_id"] intValue];
        item = [self findItemWithProductID:itemID
                                            fromProducts:cart.items];
        if (nil == item) {
            count += 1;
            
            if (1 == count)
                [cart willChangeValueForKey:@"items"];
            
            item = [[CartItem alloc] initWithCart:cart];
            item.itemID = [[itemJSON objectForKey:@"rec_id"] intValue];
            [cart addItem:item];
            // TODO refer from exists object
            item.product = [self
                                   productWithCartItemJSON:itemJSON];
            count += 1;
        }
        
        quantity = [[itemJSON objectForKey:@"goods_number"] integerValue];
        if (quantity != item.quantity)
            item.quantity = quantity;
        NSString *totalPrice = [itemJSON objectForKey:@"subtotal"];
        item.totalPrice = [NSDecimalNumber decimalNumberWithString:
                           [totalPrice substringFromIndex:1]];
    }
    
    if (count > 0)
        [cart didChangeValueForKey:@"items"];
    
    return count > 0 ? YES : NO;
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

- (CartItem *)findItemWithProductID:(NSInteger)productID
                                 fromProducts:(NSArray *)products
{
    __block CartItem *found = nil;
    [products enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CartItem *item = (CartItem *)obj;
        if (productID == item.product.productID)
            found = item;
    }];
    return found;
}
@end
