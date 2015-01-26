//
//  GKProductBackendAssembler.m
//  GKCommerce
//
//  Created by 小悟空 on 1/9/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKProductBackendAssembler.h"
#import "NSString+NSBundle.h"

@implementation GKProductBackendAssembler

- (Product *)product:(NSDictionary *)JSON
{
    Product *product = [[Product alloc] init];
    product.productID = [[JSON objectForKey:@"id"] integerValue];
    product.name = [JSON objectForKey:@"name"];
    product.productDescription = [JSON objectForKey:@"description"];
    product.listingPrice = [NSDecimalNumber decimalNumberWithString:
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

- (NSArray *)listProducts:(NSArray *)JSON
{
  NSMutableArray *products = [[NSMutableArray alloc]
                              initWithCapacity:JSON.count];
  for (NSDictionary *productJSON in JSON) {
    [products addObject:[self listProduct:productJSON]];
  }
  return products;
}

- (Product *)listProduct:(NSDictionary *)JSON
{
  Product *product = [[Product alloc] init];
  product.name = [JSON objectForKey:@"name"];
  product.listingPrice = [[NSDecimalNumber alloc]
                          initWithFloat:[[JSON objectForKey:@"listingPrice"]
                                         floatValue]];
  product.regularPrice = [[NSDecimalNumber alloc]
                          initWithFloat:[[JSON objectForKey:@"regularPrice"]
                                         floatValue]];
  product.productDescription = [JSON objectForKey:@"description"];
  
  NSArray *picturesJSON;
  NSMutableArray *pictures;
  picturesJSON = [JSON objectForKey:@"pictures"];
  pictures = [[NSMutableArray alloc] initWithCapacity:picturesJSON.count];
  for (NSString *pictureJSON in picturesJSON) {
    [pictures addObject:pictureJSON];
  }
  product.pictures = pictures;
  
  return product;
}

- (NSArray *)productCategories:(NSArray *)JSON
{
  
  NSMutableArray *categories = [[NSMutableArray alloc] init];
  for (NSDictionary *categoryJSON in JSON) {
    ProductCategory *category;
    NSString *cover, *description;
    NSArray *children;
    category = [[ProductCategory alloc] init];
    [categories addObject:category];
    category.name = [categoryJSON objectForKey:@"name"];
    category.categoryID = [[categoryJSON objectForKey:@"id"] integerValue];
    
    cover = [categoryJSON objectForKey:@"cover"];
    if (nil != cover && ![cover isKindOfClass:[NSNull class]] &&
        ![@"" isEqualToString:cover]) {
      category.cover = [cover urlForBundle];
    }
    
    description = [categoryJSON objectForKey:@"description"];
    if (nil != description && !([description isKindOfClass:[NSNull class]])) {
      category.categoryDescription = description;
    }
    
    children = [categoryJSON objectForKey:@"children"];
    if (nil != children && ![children isKindOfClass:[NSNull class]]) {
      category.children = [[NSMutableArray alloc]
                           initWithArray:[self productCategories:children]];
    }
  }
  return categories;
}

@end
