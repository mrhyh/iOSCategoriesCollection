//
//  UIColor+Hex.h
//  ylgwhyh
//
//  Created by ylgwhyh apple on 16/2/23.
//  Copyright © 2016年 ylgwhyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/**
 *  十六进制颜色值转RGB值
 *
 *  @param color 十六进制颜色值
 *
 *  @return RGB颜色值
 */
+ (UIColor*)colorWithHexString:(NSString*)color;

//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
/**
 *  十六进制颜色值转RGB值
 *
 *  @param color 十六进制颜色值
 *  @param alpha 透明度
 *
 *  @return RGB颜色值
 */
+ (UIColor*)colorWithHexString:(NSString*)color alpha:(CGFloat)alpha;

@end
