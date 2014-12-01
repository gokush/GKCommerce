//
//  MallSecondCategoryCellGrid.m
//  goku-commerce.com
//
//  Created by 小悟空 on 14-8-28.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "ProductCategoryChildTableViewCellGrid.h"

@implementation ProductCategoryChildTableViewCellGrid
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapSquare);
    
    //直线宽度
    CGContextSetLineWidth(context, 0.5);  //线宽
    
    //颜色
    CGContextSetRGBStrokeColor(context, 213/255.0, 213/255.0, 213/255.0, 1.0);
    CGContextBeginPath(context);
    //横线
    int row = self.frame.size.height / 48;
    for (int i=1; i<row; i++) {
        CGContextMoveToPoint   (context, 0, 48.0*i);
        CGContextAddLineToPoint(context, rect.size.width, 48*i);
    }
    //竖线
    CGContextMoveToPoint   (context, rect.size.width/3.0, 0);
    CGContextAddLineToPoint(context, rect.size.width/3.0, rect.size.height);
    CGContextMoveToPoint   (context, rect.size.width/3.0*2, 0);
    CGContextAddLineToPoint(context, rect.size.width/3.0*2, rect.size.height);
    CGContextStrokePath(context);
}
@end
