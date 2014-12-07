//
//  UIView+Extension.m
//  GKCommerce
//
//  Created by 小悟空 on 11/19/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+Extension.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation SeparatorOption

- (id)init
{
    self = [super init];
    if (self) {
        self.width = 1.0f;
    }
    return self;
}

- (id)initWithColor:(UIColor *)color marginLeftAndRight:(CGFloat)marginWidth
        onDirection:(SeparatorDirection)direction
{
    self = [self init];
    if (self) {
        self.color = color;
        self.marginRight = self.marginLeft = marginWidth;
        self.direction = SeparatorDirectionBottom;
    }
    return self;
}

+ (id)optionWithColor:(UIColor *)color marginLeftAndRight:(CGFloat)marginWidth
        onDirection:(SeparatorDirection)direction
{
    SeparatorOption *option;
    option = [[SeparatorOption alloc] initWithColor:color
                                 marginLeftAndRight:marginWidth
                                        onDirection:direction];
    
    return option;
}

+ (id)optionWithDirection:(SeparatorDirection)direction
{
    SeparatorOption *option = [[SeparatorOption alloc] init];
    option.direction = direction;
    option.color = [UIColor colorWithRed:0.86f green:0.86f blue:0.86f
                                   alpha:1.0f];
    option.width = 1.0f;
    return option;
}

+ (id)optionWithColor:(UIColor *)color
          onDirection:(SeparatorDirection)direction
{
    SeparatorOption *option = [self optionWithDirection:direction];
    if (!option.color)
        option.color = color;
    return  option;
}

+ (id)optionWithColor:(UIColor *)color
          onDirection:(SeparatorDirection)direction
                width:(float)width indent:(float)aIndent
{
    SeparatorOption *option = [self optionWithColor:color
                                        onDirection:direction];
    if (width)
        option.width = width;
    option.indent = aIndent;
    return option;
}

@end

@implementation UIView (Extention)

- (void)setSeparatorOnDirection:(SeparatorDirection)direction
{
    [self setSeparatorWithOption:
     [SeparatorOption optionWithDirection:direction]];
}

- (void)setSeparatorWithOption:(SeparatorOption *)option
{
    static int directions[4] = { SeparatorDirectionTop, SeparatorDirectionRight,
        SeparatorDirectionBottom, SeparatorDirectionLeft };
    
    CGRect rectangle;
    for (int i = 0; i < 4; i++) {
        if (option.direction & directions[i]) {
            CALayer *layer = [CALayer layer];
            layer.backgroundColor = option.color.CGColor;
            
            switch (directions[i]) {
                case SeparatorDirectionTop:
                    rectangle = CGRectMake(0.0f, 0.0f, self.frame.size.width,
                                           option.width);
                    break;
                case SeparatorDirectionRight:
                    rectangle = CGRectMake(self.frame.size.width - option.width,
                                           0.0f, option.width,
                                           self.frame.size.height);
                    break;
                case SeparatorDirectionBottom:
                    rectangle = CGRectMake(0,
                        self.frame.size.height - option.width + 1,
                        self.frame.size.width, option.width);
                    break;
                case SeparatorDirectionLeft:
                    rectangle = CGRectMake(0.0f, 0.0f, option.width,
                                           self.frame.size.height);
                    break;
                default:
                    break;
            }
            
            if (option.indent) {
                rectangle.origin.x += option.indent;
                rectangle.size.width -= option.indent;
            }

            rectangle.origin.x += option.marginLeft;
            rectangle.size.width -= option.marginLeft;
            rectangle.size.width -= option.marginRight;

            layer.frame = rectangle;
            [self.layer addSublayer:layer];
        }
    }
}

- (void)showHUD:(NSString *)message afterDelay:(NSTimeInterval)delay
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    hud.labelText = message;
    hud.mode = MBProgressHUDModeCustomView;
    [self addSubview:hud];
    [hud show:YES];
    [hud hide:YES afterDelay:2];
}
@end