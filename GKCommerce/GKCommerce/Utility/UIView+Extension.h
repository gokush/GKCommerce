//
//  UIView_Extension.h
//  GKCommerce
//
//  Created by 小悟空 on 11/19/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SeparatorDirectionTop = 0x01,
    SeparatorDirectionRight = 0x02,
    SeparatorDirectionBottom = 0x04,
    SeparatorDirectionLeft = 0x08,
    SeparatorDirectionAll = SeparatorDirectionTop | SeparatorDirectionRight |
    SeparatorDirectionBottom | SeparatorDirectionLeft
} SeparatorDirection;

@interface SeparatorOption : NSObject

@property (strong, nonatomic) UIColor *color;
@property (assign, nonatomic) SeparatorDirection direction;
@property (assign, nonatomic) float width;
@property (assign, nonatomic) float indent;

+ (id)optionWithDirection:(SeparatorDirection)direction;
+ (id)optionWithColor:(UIColor *)color
          onDirection:(SeparatorDirection)direction;
+ (id)optionWithColor:(UIColor *)color
          onDirection:(SeparatorDirection)direction
                width:(float)width indent:(float)aIndent;
@end

@interface UIView (Extention)

- (void)setSeparatorOnDirection:(SeparatorDirection)direction;
- (void)setSeparatorWithOption:(SeparatorOption *)option;
- (void)showHUD:(NSString *)message afterDelay:(NSTimeInterval)delay;
@end
