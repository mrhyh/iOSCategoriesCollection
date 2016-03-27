//
//  UIImageYLVC.m
//  iOSCategoriesCollection
//
//  Created by ylgwhyh on 16/3/26.
//  Copyright © 2016年 com.ylgwhyh.iOSCategoriesCollection. All rights reserved.
//

#import "UIImageYLVC.h"
#import "UIImage+YL.h"

@interface UIImageYLVC()
@property (weak, nonatomic) IBOutlet UIImageView *testImage;

@end

@implementation UIImageYLVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _testImage.image = [UIImage resizedImageWithName:@"tabbar_background"];
}

@end
