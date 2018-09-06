//
//  ViewController.m
//  circular蒙版
//
//  Created by miaomiaokeji on 2018/9/6.
//  Copyright © 2018年 weiliams. All rights reserved.
//

#import "ViewController.h"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self clipView];
}

- (void)clipView
{
    CGFloat b = 20.0;// 圆弧大小变量
    UIView *backView = [[UIView alloc] initWithFrame:(CGRect){0,100,SCREEN_WIDTH,b}];
    backView.backgroundColor = [UIColor yellowColor];
    
    
    // 半径
    CGFloat r = (SCREEN_WIDTH*0.5*SCREEN_WIDTH*0.5 + b*b)/(2.0*b);
    
    UIBezierPath *path0 = [UIBezierPath bezierPathWithRect:CGRectMake(0, b, SCREEN_WIDTH, SCREEN_HEIGHT-b)];
    
    [path0 addArcWithCenter:CGPointMake(SCREEN_WIDTH*0.5, r) radius:r startAngle:5/4.0*M_PI endAngle:8/4.0*M_PI clockwise:YES];
    
    CAShapeLayer *masklayer = [[CAShapeLayer alloc]init];//创建shapelayer
    masklayer.frame = backView.bounds;
    masklayer.path = path0.CGPath;//设置路径
    backView.layer.mask = masklayer;
    
    [self.view addSubview:backView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
