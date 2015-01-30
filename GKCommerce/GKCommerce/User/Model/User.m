//
//  User.m
//  GKCommerce
//
//  Created by 小悟空 on 11/20/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
      self.userID = [[aDecoder decodeObjectForKey:@"userID"] integerValue];
      self.sessionID = [aDecoder decodeObjectForKey:@"sessionID"];
      self.username = [aDecoder decodeObjectForKey:@"username"];
      self.email = [aDecoder decodeObjectForKey:@"email"];
      self.accessToken = [aDecoder decodeObjectForKey:@"accessToken"];
      self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
      self.cart = [[Cart alloc] initWithUser:self];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:[NSNumber numberWithInteger:self.userID]
                forKey:@"userID"];
  [aCoder encodeObject:self.sessionID forKey:@"sessionID"];
  [aCoder encodeObject:self.username forKey:@"username"];
  [aCoder encodeObject:self.email forKey:@"email"];
  [aCoder encodeObject:self.avatar forKey:@"avatar"];
  [aCoder encodeObject:self.accessToken forKey:@"accessToken"];
}

- (BOOL)authorized
{
    if (0 >= self.userID || nil == self.accessToken.accessToken ||
        [@"" isEqualToString:self.accessToken.accessToken]) {
        return NO;
    }
    return YES;
}

- (void)merge:(User *)user
{
    self.username = user.username;
    self.userID = user.userID;
    self.email = user.email;
}
@end
