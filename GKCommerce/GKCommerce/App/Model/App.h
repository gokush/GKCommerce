//
//  App.h
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App : NSObject

@property (strong, nonatomic) NSMutableArray *users;
@property (strong, nonatomic) GKUser *currentUser;

+ (instancetype)shared;
@end
