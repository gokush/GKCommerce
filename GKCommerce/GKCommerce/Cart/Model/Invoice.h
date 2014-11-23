//
//  Invoice.h
//  GKCommerce
//
//  Created by 小悟空 on 14/11/4.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InvoiceContent.h"

@interface Invoice : NSObject

@property (assign, nonatomic) NSInteger invoiceID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) InvoiceContent *content;
// TODO: contents 会有很多重复的对象
// TODO: 如有非图书和图书的发票，两种不同的类型有不同的发票内容
@property (strong, nonatomic) NSMutableArray *contents;
@end
