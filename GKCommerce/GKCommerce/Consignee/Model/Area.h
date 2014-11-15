//
//  Area.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/7.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    AreaTypeProvince,
    AreaTypeCity,
    AreaTypeDistrict
} AreaType;

@interface Area : NSObject

@property (assign, nonatomic) NSInteger areaID;
@property (strong, nonatomic) NSString *name;
@property (weak,   nonatomic) Area *parent;
@property (strong, nonatomic) NSArray *children;
@property (assign, nonatomic) AreaType type;
@end
