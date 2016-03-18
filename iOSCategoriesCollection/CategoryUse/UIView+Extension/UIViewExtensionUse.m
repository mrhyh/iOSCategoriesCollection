//
//  UIViewExtensionUse.m
//  iOSCategoriesCollection
//
//  Created by ylgwhyh on 16/3/18.
//  Copyright © 2016年 com.ylgwhyh.iOSCategoriesCollection. All rights reserved.
//

#import "UIViewExtensionUse.h"
#import "UIView+Extension.h"

@interface UIViewExtensionUse ()

@end

@implementation UIViewExtensionUse

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _testView.width = 20;
    [_testView setBorderWithWidth:3 color:[UIColor redColor] radian:5];
    
    [_testView viewHiddenAnimate:NO];
    [_testView viewAlphaAnimate:0.1 targetVal:0.9 finish:^{
        NSLog(@"test");
    }];
    
    [_testView rotationAnimation:180];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
