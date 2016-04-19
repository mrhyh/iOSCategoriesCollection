//
//  ViewController.m
//  CustomView
//
//  Created by GoBeta on 15/7/9.
//  Copyright (c) 2015年 Marshal. All rights reserved.
//

#import "ViewController.h"
#import "Line.h"
#import "Circle.h"
#import "MSBadgeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1.快速创建一个圆
    Circle *circle = [[Circle alloc] init];
    circle.frame = CGRectMake(0, 0, 100, 100);
    circle.center = self.view.center;
    circle.color = [UIColor yellowColor];
    [self.view addSubview:circle];
    //2.画水平线
    Line *line = [[Line alloc] init];
    line.frame = CGRectMake(10, 50, self.view.frame.size.width - 20, 1);
    line.color = [UIColor redColor];
    [self.view addSubview:line];
    //3.竖线
    Line *Vline = [[Line alloc] init];
    Vline.frame = CGRectMake(10, 50, 1, 300);
    Vline.color = [UIColor blueColor];
    Vline.lineStyle = VerticalStyle;
    [self.view addSubview:Vline];
    
    //4.badgeView
    MSBadgeView *badgeView = [[MSBadgeView alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
    badgeView.badgeValue = @"10";
    [self.view addSubview:badgeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
