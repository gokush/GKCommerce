//
//  Utility.h
//  GKCommerce
//
//  Created by 小悟空 on 11/19/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#ifndef GKCommerce_Utility_h
#define GKCommerce_Utility_h

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif
