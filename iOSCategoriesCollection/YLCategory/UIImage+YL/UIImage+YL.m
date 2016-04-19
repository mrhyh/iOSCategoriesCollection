


#import "UIImage+YL.h"

@implementation UIImage (YL)


#pragma mark 默认比例因子是0.5的拉伸方法
+ (UIImage *)resizedImageWithName:(NSString *)name{
     return [self resizedImageWithName:name left:0.5 top:0.5];
}


#pragma mark 带需要比例因子的拉伸方法
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

#pragma makr 根据颜色返回图片
+(UIImage*)imageWithColor:(UIColor*)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark 裁剪图片
// Returns a copy of this image that is cropped to the given bounds.
// The bounds will be adjusted using CGRectIntegral.
// This method ignores the image's imageOrientation setting.
- (UIImage *)croppedImage:(CGRect)bounds {
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], bounds);
    UIImage *croppedImage;
    if ([self respondsToSelector:@selector(scale)] && [UIImage respondsToSelector:@selector(imageWithCGImage:scale:orientation:)]) {
        croppedImage = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    } else {
        croppedImage = [UIImage imageWithCGImage:imageRef];
    }
    CGImageRelease(imageRef);
    return croppedImage;
}



@end
