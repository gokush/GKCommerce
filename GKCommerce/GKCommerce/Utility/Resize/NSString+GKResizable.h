//
//  NSString+GKResizable.h
//  Resize
//
//  Created by 小悟空 on 1/11/15.
//  Copyright (c) 2015 小悟空. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GKResizer.h"

@interface NSString (GKResizable)

- (GKResizer *)GKRSetWidth:(NSInteger)width;
- (GKResizer *)GKRSetHeight:(NSInteger)height;
- (GKResizer *)GKRGray;
- (GKResizer *)GKRRotate:(float)angle;
- (GKResizer *)GKRQuality:(float)number;
- (GKResizer *)GKRPng;
- (GKResizer *)GKRJpg;
- (GKResizer *)GKRXbm;
- (GKResizer *)GKRGif;
- (GKResizer *)GKRScale:(float)percent;
- (GKResizer *)GKRCrop:(float)widthAndHeight;
- (GKResizer *)GKRCrop:(float)width height:(float)aHeight;
- (GKResizer *)GKRSetX:(float)x;
- (GKResizer *)GKRSetY:(float)y;
- (GKResizer *)GKRCropAndFill;
@end
