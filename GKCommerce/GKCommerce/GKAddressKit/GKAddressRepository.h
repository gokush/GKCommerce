//
//  GKAddressRepository.h
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/21/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "GKUser.h"
#import "GKAddress.h"

typedef NS_ENUM(NSInteger, GKAddressQueue) {
  GKAddressQueueNone,
  GKAddressQueueCreate,
  GKAddressQueueUpdate,
  GKAddressQueueDelete
};

#define GKADDRESS_QUEUE_FROM_INT(x) \
  x == GKAddressQueueNone ? GKAddressQueueNone : \
  x == GKAddressCreate ? GKAddressCreate : \
  x == GKAddressUpdate ? GKAddressUpdate : \
  x == GKAddressDelete ? GKAddressDelete : -1;

// 发送队列

@protocol GKAddressRepository <NSObject>

- (RACSignal *)findAddressesWithUser:(GKUser *)user;
- (RACSignal *)findFailureAddressesWithUser:(GKUser *)user;
- (RACSignal *)create:(GKAddress *)address;
- (RACSignal *)update:(GKAddress *)address;

/// 更新class GKAddress对象的主键和最后更新日期
///
/// 当远程服务器成功保存用户地址后，返回的数据里面包含地址在远程服务器的数据库中的主键值和最后
/// 更新日期，此时调用[repository updatePrimary:]更新。
///
/// @return class RACSignal
/// 示例 [GKAddressRepositoryImplTests updatePrimary:]
///     [[repository updatePrimary:address] subscribe:^(GKAddress *address) {
///         assert(address.updateAt != nil)
///         assert(address.addressID > 0)
///     }]
- (RACSignal *)updatePrimary:(GKAddress *)address;
- (RACSignal *)remove:(GKAddress *)address;
- (RACSignal *)setDefault:(GKAddress *)address;

@end
