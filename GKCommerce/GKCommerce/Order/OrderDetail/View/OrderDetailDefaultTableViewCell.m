//
//  MineOrderDetailInfoCell.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-20.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "OrderDetailDefaultTableViewCell.h"

typedef enum {
    OrderDetailIDCell,
    OrderDetailQuantityOfProductCell,
    OrderDetailTotalPriceCell,
    OrderDetailPaidMoney,
    OrderDetailStatusCell,
    OrderDetailPaymentCell,
    OrderDetailAddressCell
} OrderDetailCell;

@interface OrderDetailDefaultTableViewCell ()
{
}
@end

@implementation OrderDetailDefaultTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (void)fillData
{
    if (1 == self.indexPath.row ||
        2 == self.indexPath.row ||
        3 == self.indexPath.row)
        
        self.descriptionLabel.textColor =
        [UIColor colorWithRed:255.0f/255.0f
                        green:111.0f/255.0f
                         blue:24.0f/255.0f
                        alpha:1.0f];
    
    switch (self.indexPath.row) {
        case OrderDetailIDCell:
            self.nameLabel.text = @"订单号";
            self.descriptionLabel.text = [NSString stringWithFormat:@"%@",
                                          self.order.SN];
            break;
        case OrderDetailQuantityOfProductCell:
            self.nameLabel.text = @"商品件数";
            self.descriptionLabel.text = [NSString stringWithFormat:@"%d",
                                          self.order.items.count];
            break;
        case OrderDetailTotalPriceCell:
            self.nameLabel.text = @"订单总价";
            self.descriptionLabel.text = [NSString stringWithFormat:@"￥%.2f",
                                          self.order.orderTotal.floatValue];
            break;
        case OrderDetailPaidMoney:
            self.nameLabel.text = @"实付金额";
            self.descriptionLabel.text = [NSString stringWithFormat:@"￥%.2f", self.order.paidMoney.floatValue];
            break;
        case OrderDetailStatusCell: {
            self.nameLabel.text = @"订单状态";
            NSString *orderStatus;
            switch (self.order.status) {
                case OrderStatusCanceled:
                    orderStatus = @"已取消";
                    break;
                case OrderStatusConfirmed:
                    orderStatus = @"已确认";
                    break;
                case OrderStatusInvalid:
                    orderStatus = @"无效";
                    break;
                case OrderStatusReturned:
                    orderStatus = @"退货";
                    break;
                case OrderStatusSplited:
                    orderStatus = @"已分单";
                    break;
                case OrderStatusSplitingPart:
                    orderStatus = @"部分分单";
                    break;
                case OrderStatusUnConfirmed:
                    orderStatus = @"未确认";
                    break;
                default:
                    break;
            }
            // TODO:
            self.descriptionLabel.text = orderStatus;
            break;
        }
        case OrderDetailPaymentCell: {
            self.nameLabel.text = @"支付方式";
            switch (self.order.payment.type) {
                case PaymentTypeUserBalance:
                    self.descriptionLabel.text = @"余额支付";
                    break;
                case PaymentTypeAlipay:
                    self.descriptionLabel.text = @"支付宝";
                    break;
                default:
                    self.descriptionLabel.text = @"";
                    break;
            }
            break;
        }
        case OrderDetailAddressCell: {
            self.nameLabel.text = @"收货地址";
            self.descriptionLabel.text = @"";
        }
            
        default:
            break;
    }
}

- (void)awakeFromNib
{
}
@end
