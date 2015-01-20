//
//  GKUserAccessToken.h
//  GKCommerce
//
//  Created by 小悟空 on 1/20/15.
//  Copyright (c) 2015 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  GKBearer,
  GKMAC
} GKAccessTokenType;

@interface GKUserAccessToken : NSObject

@property (strong, nonatomic) NSString *accessToken;
@property (assign, nonatomic) NSInteger expires;
@property (assign, nonatomic) GKAccessTokenType type;
@end
