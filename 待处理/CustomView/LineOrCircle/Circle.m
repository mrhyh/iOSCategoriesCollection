//
//  Circle.m
//  ZhuoYueZaiXian
//
//  Created by GoBeta on 15/5/25.
//  Copyright (c) 2015年 Marshal. All rights reserved.
//

#import "Circle.h"

@implementation Circle

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
    if (self.color == nil) {
        self.color = [UIColor redColor];
    }
    CGContextSetFillColorWithColor(context, self.color.CGColor);//填充色

    //填充圆，无边框
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，
    CGFloat x = rect.size.width*0.5;
    CGContextAddArc(context, x, x, x-1, 0, 2*M_PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathFill);//绘制填充
}
- (void)setColor:(UIColor *)color{
    _color = color;
    
    [self setNeedsDisplay];
}


@end
