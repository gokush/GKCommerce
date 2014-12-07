//
//  GKView.m
//  GKCommerce
//
//  Created by Goku on 14/11/30.
//  Copyright (c) 2014年 GKCommerce. All rights reserved.
//

#import "GKView.h"

@implementation GKView
{
    CALayer *topLayer;
    CALayer *rightLayer;
    CALayer *bottomLayer;
    CALayer *leftLayer;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    topLayer = [CALayer layer];
    rightLayer = [CALayer layer];
    bottomLayer = [CALayer layer];
    leftLayer = [CALayer layer];
    
    [self.layer addSublayer:topLayer];
    [self.layer addSublayer:rightLayer];
    [self.layer addSublayer:bottomLayer];
    [self.layer addSublayer:leftLayer];
}

- (void)setBorderColor:(UIColor *)borderColor
{
    if (_borderColor != borderColor) {
        _borderColor = borderColor;
        self.layer.borderColor = borderColor.CGColor;
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    if (_borderWidth != borderWidth) {
        _borderWidth = borderWidth;
        self.layer.borderWidth = borderWidth;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    if (_cornerRadius != cornerRadius) {
        _cornerRadius = cornerRadius;
        self.layer.cornerRadius = cornerRadius;
    }
}

- (void)setTopBorderColor:(UIColor *)topBorderColor
{
    if (_topBorderColor != topBorderColor) {
        _topBorderColor = topBorderColor;
        
        topLayer.borderColor = topBorderColor.CGColor;
    }
}

- (void)setRightBorderColor:(UIColor *)rightBorderColor
{
    if (_rightBorderColor != rightBorderColor) {
        _rightBorderColor = rightBorderColor;
        
        rightLayer.borderColor = rightBorderColor.CGColor;
    }
}

- (void)setBottomBorderColor:(UIColor *)bottomBorderColor
{
    if (_bottomBorderColor != bottomBorderColor) {
        _bottomBorderColor = bottomBorderColor;
        
        bottomLayer.borderColor = bottomBorderColor.CGColor;
    }
}

- (void)setLeftBorderColor:(UIColor *)leftBorderColor
{
    if (_leftBorderColor != leftBorderColor) {
        _leftBorderColor = leftBorderColor;
        
        leftLayer.borderColor = leftBorderColor.CGColor;
    }
}

- (void)setTopBorderWidth:(CGFloat)topBorderWidth
{
    if (_topBorderWidth != topBorderWidth) {
        _topBorderWidth = topBorderWidth;
        
        topLayer.borderWidth = topBorderWidth;
    }
}

- (void)setRightBorderWidth:(CGFloat)rightBorderWidth
{
    if (_rightBorderWidth != rightBorderWidth) {
        _rightBorderWidth = rightBorderWidth;
        
        rightLayer.borderWidth = rightBorderWidth;
    }
}

- (void)setBottomBorderWidth:(CGFloat)bottomBorderWidth
{
    if (_bottomBorderWidth != bottomBorderWidth) {
        _bottomBorderWidth = bottomBorderWidth;
        
        rightLayer.borderWidth = bottomBorderWidth;
    }
}

- (void)setLeftBorderWidth:(CGFloat)leftBorderWidth
{
    if (_leftBorderWidth != leftBorderWidth) {
        _leftBorderWidth = leftBorderWidth;
        
        leftLayer.borderWidth = leftBorderWidth;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
