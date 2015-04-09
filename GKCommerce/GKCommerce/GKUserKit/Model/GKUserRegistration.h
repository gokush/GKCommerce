//
//  GKUserRegistration.h
//  GKUserKitExample
//
//  Created by 小悟空 on 2/23/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 用户注册的模型
///
/// 被class GKUserBackend使用，用于得到需要的数据，而不是使用大量的方法参数
///
/// 示例：
///     id<GKUserBackend> signup;
///     [[GKUserBackendImpl] signup:registration];
///
/// 也可能被class [GKUserRegistrationController]使用来绑定用户输入
@interface GKUserRegistration : NSObject

/// 注册的用户名
/// 可能是用户名、电子邮件或者手机号码
@property (strong, nonatomic) NSString *username;
/// 注册用户的密码
@property (strong, nonatomic) NSString *password;
/// 用户在表单中再次输入密码
@property (strong, nonatomic) NSString *passwordAgain;
/// 用户的手机号码
@property (strong, nonatomic) NSString *mobile;
/// 电子邮件
@property (strong, nonatomic) NSString *email;

- (id)initRegistrationWithUsername:(NSString *)username passWord:(NSString *)password;
- (id)initRegistrationWithUsername:(NSString *)username passWord:(NSString *)password passwordAgain:(NSString *)passwordAgain;
- (id)initRegistrationWithUsername:(NSString *)username passWord:(NSString *)password email:(NSString *)email;

- (id)initRegistrationWithEmail:(NSString *)email passWord:(NSString *)password;
- (id)initRegistrationWithEmail:(NSString *)email passWord:(NSString *)password passwordAgain:(NSString *)passwordAgain;

- (id)initRegistrationWithMobile:(NSString *)mobile passWord:(NSString *)password;
- (id)initRegistrationWithMobile:(NSString *)mobile passWord:(NSString *)password passwordAgain:(NSString *)passwordAgain;

- (NSError *)valid;
@end
