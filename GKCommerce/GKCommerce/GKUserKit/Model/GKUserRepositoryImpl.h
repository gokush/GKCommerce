//
//  GKUserRepositoryImpl.h
//  GKUserKitExample
//
//  Created by 小悟空 on 2/24/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKUserRepository.h"

@interface GKUserRepositoryImpl : NSObject <GKUserRepository>

@property (strong, nonatomic) NSManagedObjectContext *context;
- (RACSignal *)create:(GKUser *)user;
- (RACSignal *)findUserWithID:(NSInteger)userID;
- (RACSignal *)updateLastAuthencateDate:(GKUser *)user;
- (RACSignal *)lastAuthencateUser;
@end
