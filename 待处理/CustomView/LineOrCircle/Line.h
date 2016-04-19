//
//  line.h
//  ZhuoYueZaiXian
//
//  Created by niuniu on 15-5-24.
//  Copyright (c) 2015年 Marshal. All rights reserved.
//

//画线
#import <UIKit/UIKit.h>

typedef enum {
    
    HorizontalStyle,
    VerticalStyle
    
} LineStyle;
@interface Line : UIView

@property (nonatomic ,strong) UIColor *color;

@property (nonatomic ,assign) LineStyle lineStyle;

@end
