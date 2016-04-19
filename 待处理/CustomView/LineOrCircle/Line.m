//
//  line.m
//  ZhuoYueZaiXian
//
//  Created by niuniu on 15-5-24.
//  Copyright (c) 2015年 Marshal. All rights reserved.
//

#import "Line.h"
@implementation Line

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context,kCGLineCapRound);//边缘样式
    CGContextSetLineWidth(context, 1.0);//线的宽度
    CGContextSetAllowsAntialiasing(context, YES);
    //colorWithHexString:@"e2e2e2"
    if (self.color == nil) {
        self.color = [UIColor lightGrayColor];
    }
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);//颜色

    CGContextBeginPath(context);
    //注意:线宽最小值为1.0,要获得细线,可以根据起点的y值调整,y=0为实际线宽的1/2;
    CGContextMoveToPoint(context, 0, 0);//起点
    if (!self.lineStyle) {
        self.lineStyle = HorizontalStyle;
    }
    if (self.lineStyle == HorizontalStyle) {
        CGContextAddLineToPoint(context, rect.size.width, 0);//终点
    }else if (self.lineStyle == VerticalStyle){
        CGContextAddLineToPoint(context, 0, rect.size.height);
    }
    CGContextStrokePath(context);
}
- (void)setColor:(UIColor *)color{
    _color = color;
    
    [self setNeedsDisplay];
}
- (void)setLineStyle:(LineStyle)lineStyle{
    _lineStyle = lineStyle;
    [self setNeedsDisplay];
}
@end
