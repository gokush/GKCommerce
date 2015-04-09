//
//  GKUserRepository.h
//  GKUserKitExample
//
//  Created by 小悟空 on 2/24/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "GKUser.h"

typedef NS_ENUM(NSInteger, GKUserQueue) {
    GKUserQueueNone,
    GKUserQueueCreate,
    GKUserQueueUpdate,
    GKUserQueueDelete
};

@protocol GKUserRepository <NSObject>

/// 创建本地数据库的用户记录
///
/// @return RACSignal
///
/// 示例:
///
///     id<GKUserRepository> repository;
///     [[repository create] subscribeNext:^(GKUser *user) {
///     }];
- (RACSignal *)create:(GKUser *)user;

/// 用户ID作为条件查找用户对象
///
/// @return RACSignal
///
/// 示例:
///
///    id<GKUserRepository> repository;
///    [[repository findUserWithID:1] subscribeNext:^(GKUser *user) {
///    }];
- (RACSignal *)findUserWithID:(NSInteger)userID;

- (RACSignal *)updateLastAuthencateDate:(GKUser *)user;
- (RACSignal *)lastAuthencateUser;
@end
