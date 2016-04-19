//
//  UIImage+MS.h
//  CustomView
//
//  Created by GoBeta on 15/7/9.
//  Copyright (c) 2015年 Marshal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MS)
/**
 *  剪成圆形图
 *
 *  @param name        图片名
 *  @param borderWidth 边框
 *  @param borderColor 边框颜色
 */+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
/**
 *  画弧形图
 */
+ (CAShapeLayer *)creatPaoPaoViewWithFrame:(CGRect)frame;
/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
/**
 *  根据尺寸和颜色画图
 */
+ (UIImage*)drawImageWithColor:(UIColor *)color andSize:(CGSize)size;
/**
 *  自定义图片大小
 */
+ (UIImage *) reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
@end
