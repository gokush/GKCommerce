//
//  Fixtures.m
//  GKCommerce
//
//  Created by 小悟空 on 3/8/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "Fixtures.h"
#import "App.h"
#import "Address.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "Dependency.h"

@interface Fixtures()

@property (strong, nonatomic) id<GKProductService> productService;
@end

@implementation Fixtures

- (id)init
{
    self = [super init];
    if (self) {
        self.productService = [[Dependency shared] productService];
    }
    return self;
}

- (void)install
{
    [RACObserve([App shared], currentUser) subscribeNext:^(User *user) {
        [self userDidLoad:user];
    }];
}

- (void)userDidLoad:(User *)user
{
    user.address = [self address];
    
    [[self.productService productWithID:1 user:user]
     subscribeNext:^(Product *product) {
         Cart *cart = [[Cart alloc] initWithUser:user];
         CartItemList *itemList = [[CartItemList alloc] init];
         CartItem *item = [[CartItem alloc] initWithList:itemList];
         item.product = product;
         [itemList addItem:item];
         cart.itemsOfStore = [[NSMutableArray alloc] initWithArray:@[itemList]];
         
         user.cart = cart;
    }];
}

- (Address *)address
{
    Address *address = [[Address alloc] init];
    address.addressID = 1;
    address.name = @"小悟空";
    address.cellPhone = @"15002171763";
    address.address = @"静安区愚园东路28号People Square";
    
    return address;
}

+ (Fixtures *)fixtures
{
    return [[Fixtures alloc] init];
}
@end
