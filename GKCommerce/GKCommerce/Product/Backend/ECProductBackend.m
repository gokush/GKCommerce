//
//  ECProductBackend.m
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECProductBackend.h"

@implementation ECProductBackend

- (id)init
{
    self = [super init];
    if (self) {
        self.assembler = [[ECProductBackendAssembler alloc] init];
    }
    return self;
}

- (void)requestProductWithID:(NSInteger)productID user:(User *)anUser
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:[NSString stringWithFormat:@"%d", productID]
                   forKey:@"goods_id"];
    
    if (anUser) {
        [parameters setObject:[NSString stringWithFormat:@"%d",
                               anUser.userID] forKey:@"session[uid]"];
        [parameters setObject:anUser.sessionID forKey:@"session[sid]"];
    }
    [self.manager
     POST:[NSString stringWithFormat:@"%@/goods", self.config.backendURL]
     parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestProductWithID:productID user:anUser
                 didReceiveResponse:responseObject error:nil];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self requestProductWithID:productID user:anUser
                 didReceiveResponse:nil error:error];
     }];
}

- (void)requestProductWithID:(NSInteger)productID user:(User *)anUser
          didReceiveResponse:(id)responseObject error:(NSError *)anError
{
    NSError *error = anError;
    Product *product;
    
    if (nil == anError) {
        error = [self.assembler error:responseObject];
    }
    
    product = [self.assembler product:[responseObject objectForKey:@"data"]];
    static SEL selector;
    selector = @selector(productBackend:didReceiveProduct:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate productBackend:(id<ProductBackend>)self
                    didReceiveProduct:product error:error];
}

- (void)requestProductDescription:(Product *)product
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:[NSString stringWithFormat:@"%d", product.productID]
                   forKey:@"goods_id"];
    
    [self.manager
     POST:[NSString stringWithFormat:@"%@/goods/desc", self.config.backendURL]
     parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestProductDescription:product
                      didReceiveResponse:responseObject error:nil];
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self requestProductDescription:product
                            didReceiveResponse:nil error:error];
     }];
}

- (void)requestProductDescription:(Product *)product
               didReceiveResponse:(id)responseObject error:(NSError *)anError
{
    NSError *error = anError;
    
    if (nil == anError) {
        error = [self.assembler error:responseObject];
    }
    
    NSString *productDescription;
    productDescription = [responseObject objectForKey:@"data"];
    
    static SEL selector;
    selector = @selector(productBackend:didReceiveProduct:description:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate productBackend:(id<ProductBackend>)self
                    didReceiveProduct:product description:productDescription
                                error:error];
}

- (void)requestProductsWithSearchModel:(SearchBackendModel *)searchModel
{
    
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *root = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *filter = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *pagination = [[NSMutableDictionary alloc] init];
    [root setObject:filter forKey:@"filter"];
    [root setObject:pagination forKey:@"pagination"];
    
    if (searchModel.keywords)
        [filter setValue:searchModel.keywords forKey:@"keywords"];
    
    if (searchModel.page)
        [pagination setValue:[NSNumber numberWithInteger:searchModel.page]
                      forKey:@"page"];
    
    if (searchModel.perPage)
        [pagination setValue:[NSNumber numberWithInteger:searchModel.perPage]
                      forKey:@"count"];
    
    if (searchModel.productCategoryID)
        [filter setValue:[NSNumber numberWithInteger:searchModel.productCategoryID]
                      forKey:@"category_id"];
    
    if (searchModel.sort)
        [filter setValue:searchModel.sort forKey:@"sort_by"];
    
    NSError *error;
    NSData *dumps = [NSJSONSerialization dataWithJSONObject:root options:0
                                                      error:&error];
    NSString *requestJSON;
    requestJSON = [[NSString alloc] initWithData:dumps
                                        encoding:NSUTF8StringEncoding];
    [parameters setObject:requestJSON forKey:@"json"];
    
    [self.manager
     POST:[NSString stringWithFormat:@"%@%@", self.config.backendURL, @"/search"]
     parameters:parameters
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [self requestProductsWithSearchModel:searchModel
                           didReceiveResponse:responseObject error:nil];
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self requestProductsWithSearchModel:searchModel
                           didReceiveResponse:nil error:error];
     }];
}

- (void)requestProductsWithSearchModel:(SearchBackendModel *)searchModel
                    didReceiveResponse:(id)responseObject
                                 error:(NSError *)anError
{
    NSError *error = anError;
    if (nil == anError)
        error = [self.assembler error:responseObject];
    
    NSArray *products;
    NSArray *productsJSON;
    SearchBackendModel *responseSearch;
    responseSearch = [searchModel clone];
    responseSearch.total = [[responseObject
                             valueForKeyPath:@"paginated.total"] integerValue];
    
    productsJSON = [responseObject objectForKey:@"data"];
    if (!error)
        products = [self.assembler searchProducts:productsJSON];
    
    SEL selector = @selector(productBackend:didReceiveProducts:searchModel:
                             error:);
    if ([self.delegate respondsToSelector:selector]) {
        [self.delegate productBackend:self didReceiveProducts:products
                          searchModel:responseSearch error:error];
    }
}

@end
