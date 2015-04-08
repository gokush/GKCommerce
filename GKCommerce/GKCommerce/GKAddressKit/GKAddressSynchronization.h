//
//  GKAddressSynchronization.h
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/26/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 地址提交到网络的状态
///
@interface GKAddressSynchronization : NSObject

@property (assign, nonatomic) NSInteger code;
+ (GKAddressSynchronization *)synchronizationWithInteger:(NSInteger)number;
@end

/// 地址提交成功
@interface GKAddressSynchronizationSuccess : GKAddressSynchronization
@end

/// 地址提交失败
@interface GKAddressSynchronizationFailure : GKAddressSynchronization
@end

/// 网络中断
@interface GKAddressSynchronizationMissingNetwork : GKAddressSynchronization
@end

/// 在正提交
@interface GKAddressSynchronizationSending : GKAddressSynchronization
@end

/// 再次提交中
@interface GKAddressSynchronizationAgain : GKAddressSynchronization
@end