//
//  StyleConstants.h
//  Twitter Search
//
//  Created by Aditya Trivedi on 2013-01-20.
//  Copyright (c) 2013 Aditya Trivedi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StyleConstants : NSObject

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@end
