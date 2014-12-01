//
//  ProductBackendAssembler.m
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECProductBackendAssembler.h"

@implementation ECProductBackendAssembler

- (Product *)product:(NSDictionary *)JSON
{
    Product *product = [[Product alloc] init];
    NSString *price, *marketPrice;
    price = [self digitalWithString:[JSON objectForKey:@"shop_price"]];
    
    marketPrice = [JSON objectForKey:@"market_price"];
    marketPrice = [self digitalWithString:marketPrice];
    
    product.productID = [[JSON objectForKey:@"id"] intValue];
    product.name = [JSON objectForKey:@"goods_name"];
    product.marketPrice = [NSDecimalNumber decimalNumberWithString:
                           marketPrice];
    product.price = [NSDecimalNumber decimalNumberWithString:price];
    product.stocks = [[JSON objectForKey:@"goods_number"] intValue];
    product.image = [self productImageURL:[JSON objectForKey:@"img"]];
    product.pictures = [self productImageURLs:
                        (NSArray *)[JSON objectForKey:@"pictures"]];
    product.favored =
    [[JSON objectForKey:@"is_collected"] intValue] == 0 ? NO : YES;
    
    product.onSale = [[JSON objectForKey:@"is_on_sale"] boolValue];
    
    ProductSpecification *specification;
    ProductSpecificationValue *specificationValue;
    NSMutableArray *specifications = [NSMutableArray array];
    for (NSDictionary *specificationJSON in
         (NSArray *)[JSON objectForKey:@"specification"]) {
        specification = [[ProductSpecification alloc] init];
        specificationValue = [[ProductSpecificationValue alloc] init];
        
        specification.name = [specificationJSON objectForKey:@"name"];
        specificationValue.label = [[[specificationJSON objectForKey:@"value"]
                                     objectAtIndex:0]
                                    objectForKey:@"label"];
        specification.value = specificationValue;
        
        [specifications addObject:specification];
    }
    product.specifications = specifications;
    return product;
}

- (ProductImageURL *)productImageURL:(NSDictionary *)productImageURLJSON
{
    return [[ProductImageURL alloc]
            initWithOrigin:[productImageURLJSON objectForKey:@"url"]
            small:[productImageURLJSON objectForKey:@"small"]
            thumbnail:[productImageURLJSON objectForKey:@"thumb"]];
}

- (NSArray *)productImageURLs:(NSArray *)productImageURLJSON
{
    NSMutableArray *images;
    images = [NSMutableArray arrayWithCapacity:productImageURLJSON.count];
    
    for (NSDictionary *productImage in productImageURLJSON) {
        [images addObject:[self productImageURL:productImage]];
    }
    
    return images;
}

- (NSArray *)searchProducts:(NSArray *)productsJSON
{
    NSMutableArray *products;
    products = [NSMutableArray arrayWithCapacity:productsJSON.count];

    for (NSDictionary *productJSON in productsJSON)
        [products addObject:[self searchProduct:productJSON]];
    
    return products;
}

- (Product *)searchProduct:(NSDictionary *)productJSON
{
    NSString *price, *marketPrice;
    Product *product = [[Product alloc] init];
    
    price = [self digitalWithString:[productJSON objectForKey:@"shop_price"]];
    marketPrice = [self digitalWithString:
                   [productJSON objectForKey:@"market_price"]];
    
    product.productID = [[productJSON objectForKey:@"goods_id"] intValue];
    product.name = [productJSON objectForKey:@"name"];
    product.price = [NSDecimalNumber decimalNumberWithString:price];
    product.marketPrice = [NSDecimalNumber decimalNumberWithString:marketPrice];
    
    ProductImageURL *productImage;
    productImage = [self productImageURL:[productJSON objectForKey:@"img"]];
    product.image = productImage;
    
    return product;
}

@end
