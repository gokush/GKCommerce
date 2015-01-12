//
//  GKResizer.m
//  Resize
//
//  Created by 小悟空 on 1/11/15.
//  Copyright (c) 2015 小悟空. All rights reserved.
//

#import "GKResizer.h"

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
    self = [self initWithURL:[NSURL URLWithString:url]];
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
        [resizablePath appendFormat:@",c_%.2f", self.width];
    if (self.isCrop && self.height > 0)
        [resizablePath appendFormat:@",g_%.2f", self.height];
    if (!self.isCrop && self.width > 0)
        [resizablePath appendFormat:@",w_%.2f", self.width];
    if (!self.isCrop && self.height > 0)
        [resizablePath appendFormat:@",h_%.2f", self.height];
    if (self.x > 0)
        [resizablePath appendFormat:@",x_%.2f", self.x];
    if (self.y > 0)
        [resizablePath appendFormat:@",y_%.2f", self.y];
    if (self.isGray)
        [resizablePath appendString:@",f_gray"];
    if (self.quality > 0)
        [resizablePath appendFormat:@",q_%.2f", self.quality];
    if (self.angle > 0)
        [resizablePath appendFormat:@",r_%.2f", self.angle];
    
    NSString *ext = self.extension;
    if (ext == nil || [ext isEqualToString:@""])
        ext = [url pathExtension];
    [resizablePath appendFormat:@".%@", ext];
    return resizablePath;
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
