//
//  Config.h
//  GKCommerce
//
//  Created by 小悟空 on 11/21/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PartnerID @""
//收款支付宝账号
#define SellerID  @""

//安全校验码（MD5）密钥，以数字和字母组成的32位字符
#define MD5_KEY @""

//商户私钥，自助生成
#define PartnerPrivKey @""

//支付宝公钥
#define AlipayPubKey @""

@interface GKConfig : NSObject

@property (strong, nonatomic) NSString *backendURL;
@property (strong, nonatomic) NSString *OAuthAccessTokenURL;
+ (instancetype)shared;
@end
