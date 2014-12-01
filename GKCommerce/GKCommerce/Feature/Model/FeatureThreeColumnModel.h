//
//  FeatureThreeColumnTableViewCellModel.h
//  WKCommerce
//
//  Created by 小悟空 on 14-10-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeatureThreeColumnModelItem : NSObject

@property (strong, nonatomic) NSURL *picture;
@property (strong, nonatomic) NSDecimalNumber *price;
@property (strong, nonatomic) NSString *hightlight;
@property (strong, nonatomic) Product *product;
@end

@interface FeatureThreeColumnModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *columns;
@end
