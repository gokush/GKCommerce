//
//  User.h
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (assign, nonatomic) NSInteger userID;
@property (strong, nonatomic) NSString *sessionID;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *email;
@end
