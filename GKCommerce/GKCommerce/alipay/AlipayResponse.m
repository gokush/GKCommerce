//
//  AlipayResponse.m
//  mst
//
//  Created by 魏琮举 on 14-8-29.
//  Copyright (c) 2014年 魏琮举. All rights reserved.
//

#import "AlipayResponse.h"

@implementation AlipayResponse


// DISCUSS 请求失败后，状态丢失
//- (Order *)order
//{
//    Order *order = [[Order alloc] init];
//    order.orderID = [self.trade integerValue];
//    order.subject = self.subject;
//    order.totalPrice = self.fee;
//    
//    return order;
//}

- (void)setStatusWithCode:(NSInteger)code
{
    switch (code) {
        case AlipayStatusSuccess:
            self.status = AlipayStatusSuccess;
            break;
        case AlipayStatusPaying:
            self.status = AlipayStatusPaying;
            break;
        case AlipayStatusFailure:
            self.status = AlipayStatusFailure;
            break;
        case AlipayStatusUserCancel:
            self.status = AlipayStatusUserCancel;
            break;
        case AlipayStatusConnectionError:
            self.status = AlipayStatusConnectionError;
            break;
    }
}

- (void)setSignTypeWithString:(NSString *)signType
{
    if ([@"RSA" isEqualToString:signType])
        self.signType = AlipaySignTypeRSA;
}

- (void)updateWithResult:(NSDictionary *)result
{
    
    self.partner = [result objectForKey:@"partner"];
    self.seller = [result objectForKey:@"seller_id"];
    self.trade = [result objectForKey:@"out_trade_no"];
    self.subject = [result objectForKey:@"subject"];
    self.body = [result objectForKey:@"body"];
    self.fee = [[NSDecimalNumber alloc]
                    initWithString:[result objectForKey:@"total_fee"]];
    self.notify = [NSURL URLWithString:[result objectForKey:@"notify_url"]];
    self.returnURL = [NSURL
                          URLWithString:[result objectForKey:@"return_url"]];
    self.service = [result objectForKey:@"service"];
    self.paymentType = [[result objectForKey:@"payment_type"] integerValue];
    self.show = [NSURL URLWithString:[result objectForKey:@"show_url"]];
    
    NSString *alipayTimeout = [result objectForKey:@"it_b_pay"];
    NSInteger alipayTimeoutDigitial = [[alipayTimeout
                                        substringToIndex:alipayTimeout.length]
                                       integerValue];
    NSString *timeType = [alipayTimeout
                          substringFromIndex:alipayTimeout.length -1];
    if ([@"m" isEqualToString:timeType]) {
        self.timeout = 60 * alipayTimeoutDigitial;
    } else if ([@"h" isEqualToString:timeType]) {
        self.timeout = 60 * 60 * alipayTimeoutDigitial;
    } else if ([@"d" isEqualToString:timeType]) {
        self.timeout = 60 * 60 *24 * alipayTimeoutDigitial;
    }
    
    if ([result objectForKey:@"order_id"]) {
        self.orderID = [[result objectForKey:@"order_id"] integerValue];
    }
    
    if ([result objectForKey:@"order_type"]) {
        self.orderType = [[result objectForKey:@"order_type"] integerValue];
    }
    
    
    
    if ([@"true" isEqualToString:[result objectForKey:@"success"]])
        self.success = YES;
    else
        self.success = NO;
    
    self.sign = [result objectForKey:@"sign"];
    [self setSignTypeWithString:[result objectForKey:@"sign_type"]];
    
    [self setStatusWithCode:self.statusCode];
}

- (void)updateWithResultQueryString:(NSString *)queryString
{
    self.responseText = queryString;
    return [self
            updateWithResult:[AlipayResponse parseQueryString:queryString]];
}

- (BOOL)valid:(NSString *)publicKey
{
    if (self.status != AlipayStatusSuccess)
        return NO;
    id<DataVerifier> verifier;
    verifier = CreateRSADataVerifier(publicKey);
    
    if ([verifier verifyString:self.responseText
                      withSign:self.sign]) {
        return YES;
    }
    
    return NO;
}

+ (NSString *)parseQueryStringFilter:(NSString *)queryString
{
    return [[queryString stringByReplacingOccurrencesOfString:@"\""
                                                  withString:@""]
    stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (NSDictionary *)parseQueryString:(NSString *)query {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        NSString *key = [self parseQueryStringFilter:[elements objectAtIndex:0]];
        NSString *val = [self parseQueryStringFilter:[elements objectAtIndex:1]];
        
        [dict setObject:val forKey:key];
    }
    return dict;
}

+ (AlipayResponse *)responseWithQueryString:(NSString *)queryString
{
    NSError *error;
    NSData *queryStringData;
    NSDictionary *responseJSON;
    queryStringData = [[queryString
        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
        dataUsingEncoding:NSUTF8StringEncoding];
    
    responseJSON = [NSJSONSerialization JSONObjectWithData:queryStringData
                                                   options:0
                                                     error:&error];
    
    return [self responseWithJSON:responseJSON];
}

+ (AlipayResponse *)responseWithJSON:(NSDictionary *)JSON
{
    AlipayResponse *response = [[AlipayResponse alloc] init];
    if ([@"SafePay" isEqualToString:[JSON objectForKey:@"requestType"]])
        response.requestType = AlipayRequestSafePay;
    
    NSDictionary *another = [JSON objectForKey:@"memo"];
    response.statusCode = [[another objectForKey:@"ResultStatus"] integerValue];
    response.text = [another objectForKey:@"memo"];
    
    NSString *responseText;
    NSDictionary *result;
    responseText = [self parseQueryStringFilter:
                    [another objectForKey:@"result"]];
    if (![@"" isEqualToString:responseText]) {
        response.responseText = responseText;
        result = [self parseQueryString:responseText];
        [response updateWithResult:result];
    }
    
    return response;
}

+ (AlipayResponse *)responseWithResult:(AlixPayResult *)result
{
    AlipayResponse *response = [[AlipayResponse alloc] init];
    response.statusCode = result.statusCode;
    response.text = result.statusMessage;
    [response setStatusWithCode:result.statusCode];
    [response updateWithResultQueryString:result.resultString];
    [response setSignTypeWithString:result.signType];
    response.sign = result.signString;
    return response;
}

@end
