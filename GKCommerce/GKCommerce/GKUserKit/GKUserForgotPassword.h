//
//  GKUserForgotPassword.h
//  GKUserKitExample
//
//  Created by MASGG on 15-2-26.
//  Copyright (c) 2015年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GKUserForgotPassword : NSObject
@property (strong,nonatomic) NSString *userName;
@property (strong,nonatomic) NSString *verificationCode;
@property (strong,nonatomic) NSString *password;
@end
