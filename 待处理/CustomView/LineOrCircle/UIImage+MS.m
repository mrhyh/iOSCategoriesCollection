//
//  UIImage+MS.m
//  CustomView
//
//  Created by GoBeta on 15/7/9.
//  Copyright (c) 2015年 Marshal. All rights reserved.
//

#import "UIImage+MS.h"

@implementation UIImage (MS)

+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
/**
 *  画Layer
 */
+ (CAShapeLayer *)creatPaoPaoViewWithFrame:(CGRect)frame{
    
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    CGPathRef path         = [self newBubbleWithRect:frame];
    shapLayer.path          = path;
    CFRelease(path);
    shapLayer.fillColor     = [UIColor whiteColor].CGColor;
    shapLayer.shadowColor   = [UIColor blackColor].CGColor;
    shapLayer.shadowOffset  = CGSizeMake(0.0f, 3.0f);
    shapLayer.shadowRadius  = 2.0f;
    shapLayer.shadowOpacity = 0.5f;
    shapLayer.masksToBounds = NO;
    return shapLayer;
}

+ (CGPathRef)newBubbleWithRect:(CGRect)rect {
    
    CGFloat lines         = 6.0f;//尖嘴长
    CGFloat stroke        = 1.0f;
    CGFloat radius        = 5.0f;//圆角
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat parentX       = rect.origin.x + rect.size.width/2.0f;
    
    // Determine Size
    rect.size.width       -= stroke;
    rect.size.height      -= stroke;
    rect.origin.x         += stroke / 2.0f;
    rect.origin.y         += stroke / 2.0f;
    
    // Create Callout Bubble Path
    CGPathMoveToPoint(path, NULL, rect.origin.x, rect.origin.y + radius);
    CGPathAddLineToPoint(path, NULL, rect.origin.x, rect.origin.y + rect.size.height - radius);
    CGPathAddArc(path, NULL, rect.origin.x + radius, rect.origin.y + rect.size.height - radius, radius, M_PI, M_PI_2, 1);
    CGPathAddLineToPoint(path, NULL, parentX - lines, rect.origin.y + rect.size.height);
    CGPathAddLineToPoint(path, NULL, parentX, rect.origin.y + rect.size.height + lines);
    CGPathAddLineToPoint(path, NULL, parentX + lines, rect.origin.y + rect.size.height);
    CGPathAddLineToPoint(path, NULL, rect.origin.x + rect.size.width - radius, rect.origin.y + rect.size.height);
    CGPathAddArc(path, NULL, rect.origin.x + rect.size.width - radius, rect.origin.y + rect.size.height - radius, radius, M_PI_2, 0.0f, 1.0f);
    CGPathAddLineToPoint(path, NULL, rect.origin.x + rect.size.width, rect.origin.y + radius);
    CGPathAddArc(path, NULL, rect.origin.x + rect.size.width - radius, rect.origin.y + radius, radius, 0.0f, -M_PI_2, 1.0f);
    CGPathAddLineToPoint(path, NULL, rect.origin.x + radius, rect.origin.y);
    CGPathAddArc(path, NULL, rect.origin.x + radius, rect.origin.y + radius, radius, -M_PI_2, M_PI, 1.0f);
    CGPathCloseSubpath(path);
    return path;
}

/**
 *  拉伸图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    //上左下右
    //    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.width * 0.5, image.size.width * 0.5, image.size.width * 0.5, image.size.width * 0.5) resizingMode:UIImageResizingModeStretch];
}



+ (UIImage*)drawImageWithColor:(UIColor *)color andSize:(CGSize)size
{
    UIImage *customeImage = nil;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    UIBezierPath* rectanglePath = UIBezierPath.bezierPath;
    [rectanglePath moveToPoint: CGPointMake(0, 0)];
    
    [rectanglePath addLineToPoint: CGPointMake(size.width, 0)];
    
    [rectanglePath addLineToPoint: CGPointMake(size.width, size.height)];
    
    [rectanglePath addLineToPoint: CGPointMake(0, size.height)];
    
    [rectanglePath addLineToPoint: CGPointMake(0, 0)];
    [rectanglePath closePath];
    [color setFill];
    [rectanglePath fill];
    
    customeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return customeImage;
}
+ (UIImage *) reSizeImage:(UIImage *)image toSize:(CGSize)reSize {
    
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}
@end
