//
//  ProductService.m
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "ProductService.h"
#import "ECProductBackend.h"

@implementation ProductService

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

- (void)productBackend:(id<ProductBackend>)aProductBackend
     didReceiveProduct:(Product *)aProduct error:(NSError *)anError
{
    SEL selector = @selector(productService:product:error:);
    if ([self.delegate respondsToSelector:selector])
        [self.delegate productService:self product:aProduct error:anError];
}

+ (instancetype)shared
{
    static ProductService *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}
@end
