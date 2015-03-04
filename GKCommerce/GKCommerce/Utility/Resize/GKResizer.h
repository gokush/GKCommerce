//
//  GKResizer.h
//  Resize
//
//  Created by 小悟空 on 1/11/15.
//  Copyright (c) 2015 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  GKNorthWest, GKNorth, GKNorthEast, GKWest, GKCenter, GKEast, GKSouthWest,
  GKSouth, GKSouthEast
} GKGravity;

// TODO: 新增设置Gravity

@interface GKResizer : NSObject <NSCoding>
@property (strong, nonatomic) NSURL *original;
@property (assign, nonatomic) float width;
@property (assign, nonatomic) float height;
@property (assign, nonatomic) float angle;
@property (assign, nonatomic) float quality;
@property (assign, nonatomic) float scaleWidth;
@property (assign, nonatomic) float scaleHeight;
@property (assign, nonatomic) float scaleWidthPercent;
@property (assign, nonatomic) float scaleHeightPercent;
@property (assign, nonatomic) float x;
@property (assign, nonatomic) float y;
@property (assign, nonatomic) BOOL isGray;
@property (assign, nonatomic) BOOL isScale;
@property (assign, nonatomic) BOOL isCrop;
@property (assign, nonatomic) BOOL isCropAndFill;
@property (strong, nonatomic) NSString *extension;
@property (strong, nonatomic) NSString *key;

/// 文字内容
@property (strong, nonatomic) NSString *text;

/// 前景色
@property (strong, nonatomic) UIColor *foreground;

/// 背景色
@property (strong, nonatomic) UIColor *background;

- (id)initWithURL:(NSURL *)url;
- (id)initWithString:(NSString *)url;
- (GKResizer *)width:(float)width;
- (GKResizer *)height:(float)height;
- (GKResizer *)gray;
- (GKResizer *)rotate:(float)angle;
- (GKResizer *)quality:(float)number;
- (GKResizer *)png;
- (GKResizer *)jpg;
- (GKResizer *)xbm;
- (GKResizer *)gif;
- (GKResizer *)scale:(float)percent;
- (GKResizer *)scaleWithWidth:(float)width height:(float)height;
- (GKResizer *)scaleWithWidthPercent:(float)widthPercent
                       heightPercent:(float)heightPercent;
- (GKResizer *)crop:(float)widthAndHeight;
- (GKResizer *)crop:(float)width height:(float)aHeight;
- (GKResizer *)x:(float)x;
- (GKResizer *)y:(float)y;
- (GKResizer *)cropAndFill;
- (GKResizer *)placeHold;
- (GKResizer *)text:(NSString *)aText;
- (GKResizer *)foreground:(UIColor *)aForeground;
- (GKResizer *)background:(UIColor *)aBackground;
- (UIImage *)image;
- (RACSignal *)signal;
- (NSURL *)url;
+ (instancetype)resizerWithURL:(NSURL *)url;
+ (instancetype)resizerWithString:(NSString *)url;
@end
