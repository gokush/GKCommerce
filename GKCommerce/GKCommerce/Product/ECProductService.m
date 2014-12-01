//
//  ProductService.m
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ECProductService.h"
#import "ECProductBackend.h"

@implementation ECProductService

- (id)init
{
    self = [super init];
    if (self) {
        self.repository = [[ProductRepository alloc] init];
        self.backend = [[ECProductBackend alloc] init];
        self.backend.delegate = self;
    }
    return self;
}

- (void)productWithID:(NSInteger)productID user:(User *)anUser
{
    [self.backend requestProductWithID:productID user:anUser];
}

- (void)productDescription:(Product *)product
{
    if (nil == product.productDescription ||
        0 == product.productDescription.length) {
        [self.backend requestProductDescription:product];
    } else
        [self productBackend:self.backend didReceiveProduct:product
                 description:product.productDescription error:nil];
}

- (void)productsWithSearchModel:(SearchBackendModel *)searchModel
{
    [self.backend requestProductsWithSearchModel:searchModel];
}

#pragma mark - ProductBackendDelegate

- (void)productBackend:(id<ProductBackend>)aProductBackend
     didReceiveProduct:(Product *)aProduct error:(NSError *)anError
{
    SEL selector = @selector(productService:product:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate productService:self product:aProduct error:anError];
}

- (void)productBackend:(id<ProductBackend>)aProductBackend
didReceiveProduct:(Product *)product description:(NSString *)aDescription
                 error:(NSError *)anError
{
    SEL selector = @selector(productService:product:description:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate productService:self product:product
                          description:aDescription error:anError];
}

- (void)productBackend:(id<ProductBackend>)aProductBackend
    didReceiveProducts:(NSArray *)products
           searchModel:(SearchBackendModel *)aSearchModel
                 error:(NSError *)anError
{
    SEL selector = @selector(productService:products:searchModel:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate productService:self products:products
                          searchModel:aSearchModel error:anError];
}

+ (instancetype)shared
{
    static ECProductService *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}
@end
