//
//  GKUserRepositoryImpl.m
//  GKUserKitExample
//
//  Created by 小悟空 on 2/24/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import "GKUserRepositoryImpl.h"
#import "GKUserEntity.h"

@implementation GKUserRepositoryImpl

- (GKUser *)userWithEntity:(GKUserEntity *)entity
{
  GKUser *user = [[GKUser alloc] init];
  GKUserAccessToken *token = [[GKUserAccessToken alloc] init];
  token.accessToken = entity.accessToken;
  token.expires = entity.accessTokenExpires.integerValue;
  token.type = 0 == entity.accessTokenType ? GKBearer : GKMAC;
  user.accessToken = token;
  user.userID = entity.userID.integerValue;
  user.username = entity.username;
  user.email = entity.email;
//  user.avatar = entity.avatar;
  
  return user;
}

- (RACSignal *)create:(GKUser *)user
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    NSEntityDescription *description;
    description = [NSEntityDescription entityForName:@"GKUserEntity"
                              inManagedObjectContext:self.context];
    NSNumber *expires, *type;
    expires = [NSNumber numberWithInteger: user.accessToken.expires];
    type = [NSNumber numberWithInteger: user.accessToken.type];
    GKUserEntity *entity = [[GKUserEntity alloc] initWithEntity:description
                                 insertIntoManagedObjectContext:self.context];
    entity.userID = [NSNumber numberWithInteger: user.userID];
    entity.username = user.username;
    entity.email = user.email;
    // @TODO: GKResizer 转换NSString
    entity.avatar = @"";
    entity.accessToken = user.accessToken.accessToken;
    entity.accessTokenExpires = expires;
    entity.accessTokenType = type;
    [self save];
    [subscriber sendNext:user];
    [subscriber sendCompleted];
    return (RACDisposable *)nil;
  }];
}

- (RACSignal *)findUserWithID:(NSInteger)userID
{
  return
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    NSEntityDescription *description;
    description = [NSEntityDescription entityForName:@"GKUserEntity"
                              inManagedObjectContext:self.context];
    NSFetchRequest *request;
    NSPredicate *predicate;
    NSError *error;
    NSArray *users;
    
    request = [[NSFetchRequest alloc] init];
    request.entity = description;
    predicate = [NSPredicate predicateWithFormat:@"userID = %d", userID];
    [request setPredicate:predicate];
    
    users = [self.context executeFetchRequest:request error:&error];
    
    if (error == nil) {
      [subscriber sendNext:[self userWithEntity:users.firstObject]];
      [subscriber sendCompleted];
    } else
      [subscriber sendError:error];
    return (RACDisposable *)nil;
  }];
}

- (RACSignal *)updateLastAuthencateDate:(GKUser *)user
{
    return
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSEntityDescription *description;
        description = [NSEntityDescription entityForName:@"GKUserEntity"
                                  inManagedObjectContext:self.context];
        
        NSFetchRequest *request;
        NSPredicate *predicate;
        NSError *error;
        NSArray *users;
        
        request = [[NSFetchRequest alloc] init];
        predicate = [NSPredicate predicateWithFormat:@"userID == %d",
                     user.userID];
        users = [self.context executeFetchRequest:request error:&error];
        GKUserEntity *user = users.firstObject;
        user.lastAuthencateDate = [[NSDate alloc] init];
        [self save];
        
        [subscriber sendNext:user];
        [subscriber sendCompleted];
        return nil;
    }];
}

- (RACSignal *)lastAuthencateUser
{
    return
    [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSEntityDescription *description;
        description = [NSEntityDescription entityForName:@"GKUserEntity"
                                  inManagedObjectContext:self.context];
        
        NSFetchRequest *request;
        NSSortDescriptor *sortDescriptor;
        NSError *error;
        NSArray *users;
        
        request = [[NSFetchRequest alloc] init];
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastAuthencate"
                                                     ascending:NO];
        [request setSortDescriptors:@[sortDescriptor]];
        [request setFetchLimit:1];
        users = [self.context executeFetchRequest:request error:&error];
        
        [subscriber sendNext:users.firstObject];
        [subscriber sendCompleted];
        
        return nil;
    }];
}

- (void)save
{
  NSError *error;
  if (![self.context save:&error]) {
    
  }
}
@end
