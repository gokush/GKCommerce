//
//  AlipayResponse.h
// GKCommerce
//
//  Created by 小悟空 on 14-8-29.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Order.h"
#import "AlipayUtility.h"

typedef enum {
    AlipayRequestSafePay
} AlipayRequestType;

typedef enum {
    AlipaySignTypeRSA
} AlipaySignType;

typedef enum {
    AlipayStatusSuccess = 9000,
    AlipayStatusPaying = 8000,
    AlipayStatusFailure = 4000,
    AlipayStatusUserCancel = 6001,
    AlipayStatusConnectionError = 6002
} AlipayStatus;

@interface AlipayResponse : NSObject

@property (strong, nonatomic) NSString *partner;
@property (strong, nonatomic) NSString *seller;
@property (strong, nonatomic) NSString *trade;
@property (strong, nonatomic) NSString *subject;
@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSDecimalNumber *fee;
@property (strong, nonatomic) NSURL *notify;
@property (strong, nonatomic) NSURL *returnURL;
@property (strong, nonatomic) NSString *service;
@property (assign, nonatomic) NSInteger paymentType;
@property (assign, nonatomic) NSInteger timeout;
@property (assign, nonatomic) NSInteger orderID;

@property (strong, nonatomic) NSURL *show;
@property (assign, nonatomic) BOOL success;
@property (assign, nonatomic) AlipaySignType signType;
@property (strong, nonatomic) NSString *sign;
@property (assign, nonatomic) NSInteger orderType;

@property (assign, nonatomic) AlipayRequestType requestType;
@property (assign, nonatomic) NSInteger statusCode;
@property (assign, nonatomic) AlipayStatus status;
@property (strong, nonatomic) NSString *responseText;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) Order *order;

- (void)updateWithResultQueryString:(NSString *)queryString;
- (void)setStatusWithCode:(NSInteger)code;
- (void)setSignTypeWithString:(NSString *)signType;
- (BOOL)valid:(NSString *)publicKey;

+ (AlipayResponse *)responseWithQueryString:(NSString *)queryString;
+ (AlipayResponse *)responseWithJSON:(NSDictionary *)JSON;
+ (AlipayResponse *)responseWithResult:(AlixPayResult *)result;
@end
