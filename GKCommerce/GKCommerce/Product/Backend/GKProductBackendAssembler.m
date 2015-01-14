//
//  GKProductBackendAssembler.m
//  GKCommerce
//
//  Created by 小悟空 on 1/9/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKProductBackendAssembler.h"

@implementation GKProductBackendAssembler

- (Product *)product:(NSDictionary *)JSON
{
    Product *product = [[Product alloc] init];
    product.productID = [[JSON objectForKey:@"id"] integerValue];
    product.name = [JSON objectForKey:@"name"];
    product.productDescription = [JSON objectForKey:@"description"];
    product.price = [NSDecimalNumber decimalNumberWithString:
        [JSON objectForKey:@"regularPrice"]];
    
    NSArray *picturesJSON;
    NSMutableArray *pictures;
    picturesJSON = [JSON objectForKey:@"pictures"];
    pictures = [[NSMutableArray alloc] initWithCapacity:picturesJSON.count];
    for (NSDictionary *pictureJSON in picturesJSON) {
        [pictures addObject:[pictureJSON objectForKey:@"url"]];
    }
    product.pictures = pictures;
    return product;
}
@end
