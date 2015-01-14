//
//  NSString+GKResizable.m
//  Resize
//
//  Created by 小悟空 on 1/11/15.
//  Copyright (c) 2015 小悟空. All rights reserved.
//

#import "NSString+GKResizable.h"

@implementation NSString (GKResizable)

- (GKResizer *)GKRSetWidth:(NSInteger)width
{
    return [[GKResizer resizerWithString:self] width:width];
}

- (GKResizer *)GKRSetHeight:(NSInteger)height
{
    return [[GKResizer resizerWithString:self] height:height];
}

- (GKResizer *)GKRGray
{
    return [[GKResizer resizerWithString:self] gray];
}

- (GKResizer *)GKRRotate:(float)angle
{
    return [[GKResizer resizerWithString:self] rotate:angle];
}

- (GKResizer *)GKRQuality:(float)number
{
    return [[GKResizer resizerWithString:self] quality:number];
}

- (GKResizer *)GKRPng
{
    return [[GKResizer resizerWithString:self] png];
}

- (GKResizer *)GKRJpg
{
    return [[GKResizer resizerWithString:self] jpg];
}

- (GKResizer *)GKRXbm
{
    return [[GKResizer resizerWithString:self] xbm];
}

- (GKResizer *)GKRGif
{
    return [[GKResizer resizerWithString:self] gif];
}

- (GKResizer *)GKRScale:(float)percent
{
    return [[GKResizer resizerWithString:self] scale:percent];
}

- (GKResizer *)GKRCrop:(float)widthAndHeight
{
    return [[GKResizer resizerWithString:self] crop:widthAndHeight];
}

- (GKResizer *)GKRCrop:(float)width height:(float)aHeight
{
    return [[GKResizer resizerWithString:self] crop:width height:aHeight];
}

- (GKResizer *)GKRSetX:(float)x
{
    return [[GKResizer resizerWithString:self] x:x];
}

- (GKResizer *)GKRSetY:(float)y
{
    return [[GKResizer resizerWithString:self] y:y];
}

- (GKResizer *)GKRCropAndFill
{
    return [[GKResizer resizerWithString:self] cropAndFill];
}
@end
