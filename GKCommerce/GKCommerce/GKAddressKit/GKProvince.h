//
//  GKProvince.h
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/19/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKRegion.h"

@interface GKProvince : GKRegion

@property (assign, nonatomic) NSInteger provinceID;
@property (strong, nonatomic) NSArray   *cities;
@end
