//  Created by niuniu on 15-5-24.
//  Copyright (c) 2015年 Marshal. All rights reserved.

#import "MSBadgeView.h"
#import "UIImage+MS.h"

@implementation MSBadgeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setBackgroundImage:[UIImage imageNamed:@"others_communica_point"] forState:UIControlStateNormal];
        // 按钮的高度就是背景图片的高度
        CGRect frame = self.frame;
        frame.size = CGSizeMake(frame.size.width, self.currentBackgroundImage.size.height);
        self.frame = frame;
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    // 设置文字
    [self setTitle:badgeValue forState:UIControlStateNormal];
    
    // 根据文字计算自己的尺寸
    CGSize titleSize = [badgeValue sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGFloat bgW = self.currentBackgroundImage.size.width;
    if (titleSize.width < bgW) {
        CGRect frame = self.frame;
        frame.size.width = bgW;
        self.frame = frame;
    } else {
        CGRect frame = self.frame;
        frame.size.width = titleSize.width + 10;;
        self.frame = frame;
    }
}

@end
