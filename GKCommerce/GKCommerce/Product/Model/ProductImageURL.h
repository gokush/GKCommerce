//
//  ProductImage.h
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-8.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductImageURL : NSObject <NSCoding>

@property (nonatomic, strong) NSString *origin;
@property (nonatomic, strong) NSString *small;
@property (nonatomic, strong) NSString *thumbnail;

- (id)initWithOrigin:(NSString *)origin
               small:(NSString *)aSmall
           thumbnail:(NSString *)aThumbnail;

@end
