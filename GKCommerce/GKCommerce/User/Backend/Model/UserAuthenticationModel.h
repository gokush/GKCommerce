//
//  UserAuthenticationModel.h
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAuthenticationModel : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;

- (id)initWithUsername:(NSString *)username password:(NSString *)aPassword;

- (NSError *)valid;
@end
