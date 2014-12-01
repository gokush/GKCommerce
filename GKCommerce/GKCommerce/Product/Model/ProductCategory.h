//
//  Category.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-10-11.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductCategory : NSObject <NSCoding>

@property (assign, nonatomic) NSInteger categoryID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *categoryDescription;
@property (strong, nonatomic) NSMutableArray *children;
@property (strong, nonatomic) NSURL *cover;

- (NSArray *)namesOfChildren;
@end
