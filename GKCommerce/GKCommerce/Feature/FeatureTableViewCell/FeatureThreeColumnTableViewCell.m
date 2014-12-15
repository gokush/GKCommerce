//
//  FeatureThreeColumnCell.m
//  GKCommerce
//
//  Created by 小悟空 on 14-10-17.
//  Copyright (c) 2014年 小悟空. All rights reserved.
//

#import "FeatureThreeColumnTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation FeatureThreeColumnTableViewCell

- (void)setModel:(FeatureThreeColumnModel *)model
{
    _model = model;
    [self renderColumns];
}

- (void)renderColumns
{
    for (UIView *child in self.columnView.subviews)
        [child removeFromSuperview];
    self.title.text = self.model.title;
    int i = 0, size = self.model.columns.count;
    for (; i < size; i++) {
        FeatureThreeColumnModelItem *itemModel;
        itemModel = [self.model.columns objectAtIndex:i];
        [self.columnView addSubview:[self createFeatureThreeColumnItem:itemModel
                                                    atIndex:i]];
    }
}

- (UIView *)createFeatureThreeColumnItem:(FeatureThreeColumnModelItem *)model
                                 atIndex:(NSInteger)index;
{
    FeatureTableViewCellColumn *item;
    UIImageView *imageView;
    UITextField *priceTextField, *highlightTextField;
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:10.0f];
    static float width = 106.5;
    static float height = 120.0;
    item = [[FeatureTableViewCellColumn alloc]
            initWithFrame:CGRectMake(index * width, 0.0f, width, height)];
    
    item.userInteractionEnabled = YES;
    item.product = model.product;
    
    UITapGestureRecognizer *recognizer;
    recognizer = [[UITapGestureRecognizer alloc]
                  initWithTarget:self action:@selector(didTapColumn:)];
    [item addGestureRecognizer:recognizer];
    
    imageView = [[UIImageView alloc]
                 initWithFrame:CGRectMake((width - 65.0f) / 2,
                                          7.5f, 65.0f, 65.0f)];
    [imageView sd_setImageWithURL:model.picture];
    
    [item addSubview:imageView];
    
    priceTextField = [[UITextField alloc]
                      initWithFrame:CGRectMake(0.0f, 78.0f, width, 20.0f)];
    priceTextField.contentHorizontalAlignment =
        UIControlContentHorizontalAlignmentCenter;
    priceTextField.textAlignment = NSTextAlignmentCenter;
    priceTextField.font = font;
    priceTextField.text = [[NSString alloc]
                           initWithFormat:@"￥%.2f", model.price.floatValue];
    priceTextField.textColor = [UIColor colorWithRed:202.05 / 255.0f
                                                green:6.0f / 255.0f
                                                 blue:6.0f / 255.0f
                                                alpha:1.0f];
    [item addSubview:priceTextField];
    
    NSDictionary *attributes;
    attributes = @{
        NSFontAttributeName:font
    };
    
    UIView *highlightBackground;
    CGRect highlightBackgroundRect;
    highlightBackgroundRect = CGRectMake(35.0f, 95.0f, 35.0f, 16.0f);
    highlightBackground = [[UIView alloc]
                           initWithFrame:highlightBackgroundRect];
    highlightTextField = [[UITextField alloc]
                          initWithFrame:CGRectMake(0.0f, 0.0f, 35.0f,
                                                   16.0f)];
    highlightTextField.contentHorizontalAlignment =
        UIControlContentHorizontalAlignmentCenter;
    highlightTextField.textAlignment = NSTextAlignmentCenter;
    highlightTextField.font = font;
    highlightTextField.text = model.hightlight;
    highlightTextField.textColor = [UIColor whiteColor];
    
    highlightBackground.backgroundColor = [UIColor colorWithRed:238.0f / 255.0f
                                                         green:170.0f / 255.0f
                                                          blue:170.0f / 255.0f
                                                         alpha:1.0f];
    [highlightBackground addSubview:highlightTextField];
    highlightBackground.layer.cornerRadius = 3.0f;
    [item addSubview:highlightBackground];
    
    
    UIColor *borderColor;
    borderColor = [UIColor colorWithRed:220.0f / 255.0f
                                  green:220.0f / 255.0f
                                   blue:220.0f / 255.0f
                                  alpha:1.0f];
    
    CALayer *topLayer = [CALayer layer];
    topLayer.borderColor = borderColor.CGColor;
    topLayer.borderWidth = 1;
    topLayer.frame = CGRectMake(0.0f, 0.0f, width, 1.0f);
    [item.layer addSublayer:topLayer];
    
    CALayer *rightLayer = [CALayer layer];
    rightLayer.borderColor = borderColor.CGColor;
    rightLayer.borderWidth = 1;
    rightLayer.frame = CGRectMake(width, 0.0f, 1.0f, height);
    
    if (index < self.model.columns.count - 1)
        [item.layer addSublayer:rightLayer];
    
    CALayer *bottomLayer = [CALayer layer];
    bottomLayer.borderColor = borderColor.CGColor;
    bottomLayer.borderWidth = 1;
    bottomLayer.frame = CGRectMake(0.0f, height, width, 1.0f);
    [item.layer addSublayer:bottomLayer];
    return item;
}

- (void)didTapColumn:(id)sender
{
    UITapGestureRecognizer *recognizer;
    recognizer = (UITapGestureRecognizer *)sender;
    FeatureTableViewCellColumn *column;
    column = (FeatureTableViewCellColumn *)recognizer.view;
    if ([self.delegate
         respondsToSelector:@selector(featureTableViewCell:didSelectProduct:)])
        [self.delegate featureTableViewCell:self
                           didSelectProduct:column.product];
}
@end
