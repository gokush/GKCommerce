//
//  GKCounty.h
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/19/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKCounty : NSObject

@property (assign, nonatomic) NSInteger countyID;
@property (strong, nonatomic) NSString  *code;
@property (strong, nonatomic) NSString  *name;
@property (strong, nonatomic) NSString  *pinyin;
@property (strong, nonatomic) NSArray   *towns;

@end
