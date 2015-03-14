//
//  GKResizer.m
//  Resize
//
//  Created by 小悟空 on 1/11/15.
//  Copyright (c) 2015 小悟空. All rights reserved.
//

#import "GKResizer.h"
#import <wand/magick_wand.h>
#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/SDWebImageManager.h>
#import "NSString+NSBundle.h"

@implementation GKResizer

- (id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super init];
  if (self) {
    self.original = [aDecoder decodeObjectForKey:@"original"];
  }
  return self;
}

- (id)initWithURL:(NSURL *)url
{
    self = [super init];
    if (self) {
      self.original = url;
        
        if ([@"placehold" isEqualToString:self.original.host]) {
            [self parsePlaceHold];
            self.isPlaceHold = YES;
        }
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

- (void)parsePlaceHold
{
    NSString *path = self.original.path;
    path = [path substringWithRange:NSMakeRange(1, path.length - 1)];
    NSArray *components = [path componentsSeparatedByString:@"/"];
    UIColor *foreground, *background;

    BOOL matched = NO;
    for (NSString *component in components) {
        if (!matched) {
            matched = [self matchComponent:component];
        }
        if (6 == component.length) {
            NSScanner *scanner;
            NSString *hex;
            unsigned color;
            hex = [NSString stringWithFormat:@"0x%@", component];
            scanner = [NSScanner scannerWithString:hex];
            [scanner scanHexInt:&color];
            
            if (nil == foreground)
                foreground = [self colorWithHex:color];
            else
                background = [self colorWithHex:color];
        }
    }
    
    if (nil == self.text || [@"" isEqualToString:self.text])
        self.text = [NSString stringWithFormat:@"%d x %d", (int)self.width,
                     (int)self.height];
}

- (BOOL)matchComponent:(NSString *)component
{
    NSError *error;
    NSRegularExpression *express;
    NSArray *matches;
    NSTextCheckingResult *match;
    express = [NSRegularExpression
               regularExpressionWithPattern:@"(\\d+)x?(\\d+)?&?(.*)"
               options:0 error:&error];
    
    matches = [express matchesInString:component options:0
                                 range:NSMakeRange(0, component.length)];
    if (0 == matches.count)
        return NO;
    
    match = matches.firstObject;

    NSString *width, *height, *text;
    width = [self match:match atIndex:1 string:component];
    height = [self match:match atIndex:2 string:component];
    text = [self match:match atIndex:3 string:component];
    
    if (width != nil)
        self.width = [width floatValue];
    if (height != nil)
        self.height = [height floatValue];
    if (0 == self.height)
        self.height = self.width;
    if (text != nil)
        self.text = text;
    
    return YES;
}

- (NSString *)match:(NSTextCheckingResult *)match atIndex:(NSInteger)index
             string:(NSString *)aString
{
    NSRange range = [match rangeAtIndex:index];
    if (aString.length < range.location + range.length)
        return nil;
    
    return [aString substringWithRange:range];
}

- (UIColor *)colorWithHex:(unsigned)hex
{
    float r = hex & 0xFF0000 >> 16;
    float g = hex & 0xFF00 >> 8;
    float b = hex & 0xFF;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}


- (NSString *)key
{
  NSMutableArray *combination = [[NSMutableArray alloc] init];
  [combination addObject:[[self.original description] md5]];
  if (0 < self.width)
    [combination
     addObject:[NSString stringWithFormat:@"width_%.2f", self.width]];
  if (0 < self.height)
    [combination
     addObject:[NSString stringWithFormat:@"height_%.2f", self.height]];
  if (0 < self.x)
    [combination
     addObject:[NSString stringWithFormat:@"x_%.2f", self.x]];
  if (0 < self.y)
    [combination
     addObject:[NSString stringWithFormat:@"y_%.2f", self.y]];
  if (0 < self.angle)
    [combination
     addObject:[NSString stringWithFormat:@"angle_%.6f", self.angle]];
  if (0 < self.quality)
    [combination
     addObject:[NSString stringWithFormat:@"quality_%.2f", self.quality]];
  if (0 < self.x)
    [combination
     addObject:[NSString stringWithFormat:@"x_%.2f", self.x]];
  if (self.isGray)
    [combination addObject:@"gray"];
  if (self.isCrop)
    [combination addObject:@"crop"];
  if (self.isScale)
    [combination addObject:@"scale"];
  if (0 < self.scaleWidth)
    [combination addObject:[NSString
                            stringWithFormat:@"scale_width_%.2f",
                            self.scaleWidth]];
  if (0 < self.scaleHeight)
    [combination addObject:[NSString
                            stringWithFormat:@"scale_height_%.2f",
                            self.scaleHeight]];
  
  if (0 < self.scaleWidthPercent)
    [combination addObject:[NSString
                            stringWithFormat:@"scale_width_percent_%.2f",
                            self.scaleWidthPercent]];
  if (0 < self.scaleHeightPercent)
    [combination addObject:[NSString
                            stringWithFormat:@"scale_height_percent_%.2f",
                            self.scaleHeightPercent]];
  
  return [combination componentsJoinedByString:@"_"];
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
    self.scaleWidthPercent = self.scaleHeightPercent = percent;
    return self;
}

- (GKResizer *)scaleWithWidth:(float)width height:(float)height
{
  self.scaleWidth = width;
  self.scaleHeight = height;
  return self;
}

- (GKResizer *)scaleWithWidthPercent:(float)widthPercent
                       heightPercent:(float)heightPercent
{
  self.scaleWidthPercent = widthPercent;
  self.scaleHeightPercent = heightPercent;
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
    if (self.isPlaceHold)
        return [self placeHold];
    
    MagickWand *mw = NewMagickWand();
    MagickReadImage(mw, [[self.original absoluteString]
                         cStringUsingEncoding:NSUTF8StringEncoding]);
    
    [self processImage:mw];
    
    size_t length;
    unsigned char *blob = MagickGetImageBlob(mw, &length);
    
    DestroyMagickWand(mw);
    MagickWandTerminus();
    
    if (NULL == blob)
        return nil;
    
    NSData *bytes = [[NSData alloc] initWithBytes:blob length:length];
    return [[UIImage alloc] initWithData:bytes];
}

- (UIImage *)imageWithPath:(NSString *)path
{
    MagickWand *mw = NewMagickWand();
    MagickReadImage(mw, [path cStringUsingEncoding:NSUTF8StringEncoding]);
  
    [self processImage:mw];
  
    size_t length;
    unsigned char *blob = MagickGetImageBlob(mw, &length);
    DestroyMagickWand(mw);
    MagickWandTerminus();
    NSData *bytes = [[NSData alloc] initWithBytes:blob length:length];
    return [[UIImage alloc] initWithData:bytes];
}

- (UIImage *)imageWithImageRef:(CGImageRef)anImageRef
{
    CGDataProviderRef provider = CGImageGetDataProvider(anImageRef);
    NSData* data = (id)CFBridgingRelease(CGDataProviderCopyData(provider));
    
    size_t length;
    MagickWand *mw = NewMagickWand();
    MagickReadImageBlob(mw, [data bytes], [data length]);
    [self processImage:mw];
    unsigned char *blob = MagickGetImageBlob(mw, &length);
    NSData *bytes = [[NSData alloc] initWithBytes:blob length:length];
    return [[UIImage alloc] initWithData:bytes];
}

- (void)processImage:(MagickWand *)mw
{
  float width, height;
  width = MagickGetImageWidth(mw);
  height = MagickGetImageHeight(mw);
  
  BOOL bigThanOriginal = NO;
  bigThanOriginal = self.width > width || self.height > height;
  if (self.width > 0 || self.height > 0) {
    if (bigThanOriginal)
      MagickScaleImage(mw, self.width, self.height);
    
    if (self.isCrop) {
      MagickCropImage(mw, self.width, self.height, 0, 0);
    }
  }
  
}

- (RACSignal *)signal
{
  DDLogVerbose(@"Create signal with %@", self.original);
  @weakify(self);
  return
  // TODO: 完成这个原型
  // 图片Resize的模式有三种：本地文件、远程文件下载到本地Resizer、远程支持Resize
  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      @strongify(self);
      SDImageCache *cache = [SDImageCache sharedImageCache];
      __block UIImage *local;
      BOOL exists, isOnRemote;
      NSString *cacheKey, *scheme;
      cacheKey = [self key];
      scheme = self.original.scheme;
      local = [cache imageFromDiskCacheForKey:cacheKey];
      local = nil;
      exists = nil != local;
      isOnRemote = ![@"file" isEqualToString:scheme];
      
      DDLogVerbose(@"从SDWebCache加载文件 %@", cacheKey);
      if (!isOnRemote && !exists) {
        local = [self image];
        [cache storeImage:local forKey:cacheKey toDisk:YES];
        
        [subscriber sendNext:local];
        [subscriber sendCompleted];
        DDLogVerbose(@"加载原始图片处理并保存到SDWebCache");
      } else if (isOnRemote && !exists) {
          if (!self.isPlaceHold)
              [self downloadAndProcess:subscriber];
          else {
              UIImage *placeHoldImage;
              placeHoldImage = [self placeHold];
              [subscriber sendNext:placeHoldImage];
              [subscriber sendCompleted];
              
              [cache storeImage:placeHoldImage forKey:cacheKey toDisk:YES];
          }
      }
    return [RACDisposable disposableWithBlock:^{}];
  }];
}

- (void)downloadAndProcess:(id<RACSubscriber>)subscriber
{
    [[SDWebImageManager sharedManager]
     downloadImageWithURL:self.original options:0 progress:nil
     completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType,
                 BOOL finished, NSURL *imageURL) {
         SDImageCache *cache = [SDImageCache sharedImageCache];
         UIImage *processed;
         NSString *originalPath, *cacheOriginPath;
         originalPath = [self.original description];
         cacheOriginPath = [cache defaultCachePathForKey:originalPath];
         [cache storeImage:image forKey:originalPath];
         processed = [self imageWithPath:cacheOriginPath];
         [cache storeImage:processed forKey:[self key]];
         
         [subscriber sendNext:processed];
         [subscriber sendCompleted];
         DDLogVerbose(@"从远程加载原始图片处理并保存到SDWebCache");
         DDLogVerbose(@"%@", self.original);
     }];
}

- (UIImage *)placeHold
{
    
    UIFont *font = [UIFont fontWithName:@"American Typewriter" size:40];
    CGRect frame, rect;
    frame = [self.text
             boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
             options:NSStringDrawingUsesLineFragmentOrigin
             attributes:@{ NSFontAttributeName:font } context:nil];
    
    UIGraphicsBeginImageContext(CGSizeMake(self.width, self.height));
    rect = CGRectMake((self.width - frame.size.width) / 2,
                      (self.height - frame.size.height) / 2,
                      self.width, self.height);
    
    [[UIColor grayColor] set];
    [self.text drawInRect:CGRectIntegral(rect) withFont:font];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return textImage;
}

- (GKResizer *)text:(NSString *)aText
{
    self.text = aText;
    return self;
}

- (GKResizer *)foreground:(UIColor *)aForeground
{
    self.foreground = aForeground;
    return self;
}

- (GKResizer *)background:(UIColor *)aBackground
{
    self.background = aBackground;
    return self;
}

- (NSURL *)url
{
    return [NSURL URLWithString:[self description]];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:self.original forKey:@"original"];
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
