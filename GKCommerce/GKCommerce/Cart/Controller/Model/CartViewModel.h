//
//  CartViewModel.h
//  GKCommerce
//
//  Created by 小悟空 on 12/9/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartItemListViewModel.h"

@interface CartViewModel : NSObject

@property (weak, nonatomic) Cart *cart;
@property (strong, nonatomic) NSMutableArray *list;
- (id)initWithCart:(Cart *)cart;
@end
