//
//  GKResizer.m
//  Resize
//
//  Created by 小悟空 on 1/11/15.
//  Copyright (c) 2015 小悟空. All rights reserved.
//

#import "GKResizer.h"
#import <wand/magick_wand.h>
#import "NSString+NSBundle.h"

@implementation GKResizer

- (id)initWithURL:(NSURL *)url
{
    self = [super init];
    if (self) {
      self.original = url;
    }
    return self;
}

- (id)initWithString:(NSString *)url
{
  if ([url isBundlePath])
    url = [NSString stringWithFormat:@"file://%@", [url pathForBundle]];
  self = [self initWithURL:[NSURL URLWithString:url]];
  if (self) {
  }
    return self;
}

- (GKResizer *)width:(float)width
{
    self.width = width;
    return self;
}

- (GKResizer *)height:(float)height
{
    self.height = height;
    return self;
}

- (GKResizer *)gray
{
    self.isGray = YES;
    return self;
}

- (GKResizer *)rotate:(float)angle
{
    self.angle = angle;
    return self;
}

- (GKResizer *)quality:(float)number
{
    self.quality = number;
    return self;
}

- (GKResizer *)png
{
    self.extension = @"png";
    return self;
}

- (GKResizer *)jpg
{
    self.extension = @"jpg";
    return self;
}

- (GKResizer *)xbm
{
    self.extension = @"xmb";
    return self;
}

- (GKResizer *)gif
{
    self.extension = @"gif";
    return self;
}

- (GKResizer *)scale:(float)percent
{
    self.scaleWidth = self.scaleHeight = percent;
    return self;
}

- (GKResizer *)crop:(float)widthAndHeight
{
    self.width = self.height = widthAndHeight;
    self.isCrop = YES;
    return self;
}

- (GKResizer *)crop:(float)width height:(float)aHeight
{
    self.width = width;
    self.height = aHeight;
    self.isCrop = YES;
    return self;
}

- (GKResizer *)x:(float)x
{
    self.x = x;
    return self;
}

- (GKResizer *)y:(float)y
{
    self.y = y;
    return self;
}

- (GKResizer *)cropAndFill
{
    self.isCropAndFill = YES;
    return self;
}

- (NSString *)description
{
    NSURL *url = self.original;
    NSMutableString *resizablePath;
    resizablePath = [[NSMutableString alloc] initWithString:[url scheme]];
    [resizablePath appendString:@"://"];
    [resizablePath appendString:[url host]];
    if ([url port])
        [resizablePath appendFormat:@":%d", [[url port] intValue]];
    [resizablePath appendString:[[url path] stringByDeletingPathExtension]];
    
    if (self.isCrop && self.width > 0)
        [resizablePath appendFormat:@",c_%d", (int)self.width];
    if (self.isCrop && self.height > 0)
        [resizablePath appendFormat:@",g_%d", (int)self.height];
    if (self.x > 0)
        [resizablePath appendFormat:@",x_%d", (int)self.x];
    if (self.y > 0)
        [resizablePath appendFormat:@",y_%d", (int)self.y];
    if (self.isGray)
        [resizablePath appendString:@",f_gray"];
    if (self.quality > 0)
        [resizablePath appendFormat:@",q_%d", (int)self.quality];
    if (self.angle > 0)
        [resizablePath appendFormat:@",r_%d", (int)self.angle];
    
    // TODO: 后端有一个BUG EvaThumber，参数顺序只能是c_fill,h_100,w_100
    // 如果是w_100,h_100,c_fill不能工作
    if (self.isCropAndFill)
        [resizablePath appendFormat:@",c_fill"];
    if (!self.isCrop && self.height > 0)
        [resizablePath appendFormat:@",h_%d", (int)self.height];
    if (!self.isCrop && self.width > 0)
        [resizablePath appendFormat:@",w_%d", (int)self.width];
    
    NSString *ext = self.extension;
    if (ext == nil || [ext isEqualToString:@""])
        ext = [url pathExtension];
    [resizablePath appendFormat:@".%@", ext];
    return resizablePath;
}

- (UIImage *)image
{
  MagickWand *mw = NewMagickWand();
  MagickReadImage(mw, [[self.original absoluteString]
                       cStringUsingEncoding:NSUTF8StringEncoding]);
  float width, height;
  width = MagickGetImageWidth(mw);
  height = MagickGetImageHeight(mw);
  
  if (self.width > 0 || self.height > 0) {
    MagickScaleImage(mw, self.width, self.height);
    
    if (self.isCrop) {
      MagickCropImage(mw, self.width, self.height, 0, 0);
    }
  }
  
  size_t length;
  unsigned char *blob = MagickGetImageBlob(mw, &length);
  NSData *bytes = [[NSData alloc] initWithBytes:blob length:length];

  return [[UIImage alloc] initWithData:bytes];
}

- (NSURL *)url
{
    return [NSURL URLWithString:[self description]];
}

+ (instancetype)resizerWithURL:(NSURL *)url
{
    return [[GKResizer alloc] initWithURL:url];
}

+ (instancetype)resizerWithString:(NSString *)url
{
    return [[GKResizer alloc] initWithString:url];
}
@end
