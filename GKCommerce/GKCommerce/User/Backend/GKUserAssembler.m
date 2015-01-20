//
//  GKUserAssembler.m
//  GKCommerce
//
//  Created by 小悟空 on 1/15/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserAssembler.h"

@implementation GKUserAssembler

- (User *)user:(NSDictionary *)anUser;
{
    User *user = [[User alloc] init];
    user.email = [anUser objectForKey:@"email"];
    user.username = [anUser objectForKey:@"username"];
    user.userID = [[anUser objectForKey:@"id"] integerValue];
    return user;
}

- (GKUserAccessToken *)accessTokenWithAuthenticate:(NSDictionary *)authenticate
{
  NSString *tokenType;
  GKUserAccessToken *accessToken;
  tokenType = [[authenticate objectForKey:@"token_type"] lowercaseString];
  accessToken = [[GKUserAccessToken alloc] init];
  if ([@"bearer" isEqualToString:tokenType])
    accessToken.type = GKBearer;
  else if ([@"bearer" isEqualToString:tokenType])
    accessToken.type = GKMAC;
  accessToken.accessToken = [authenticate objectForKey:@"access_token"];
  accessToken.expires = [[authenticate objectForKey:@"expires_in"]
                         integerValue];
  return accessToken;
}
@end
