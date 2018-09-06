//
//  ViewController.m
//  GBClipImageDemo
//
//  Created by Grabin on 2017/9/18.
//  Copyright © 2017年 GrabinWong. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self clipImage];
    
    [self clipView];
    
}

- (void)clipView
{
    UIView *backView = [[UIView alloc] initWithFrame:(CGRect){0,100,SCREEN_WIDTH,20}];
    backView.backgroundColor = [UIColor yellowColor];
    
    CGFloat b = 20.0;
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

- (void)clipImage
{
    UIImage *textImage = [UIImage imageNamed:@"text"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:textImage];
    
    imageView.frame = self.view.bounds;
    
    // 半径
    CGFloat r = (SCREEN_WIDTH*0.5*SCREEN_WIDTH*0.5 + 80.0*80.0)/(2.0*80.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 80.0, SCREEN_WIDTH, SCREEN_HEIGHT-80.0)];
    
    [path addArcWithCenter:CGPointMake(SCREEN_WIDTH*0.5, r) radius:r startAngle:5/4.0*M_PI endAngle:8/4.0*M_PI clockwise:YES];
    
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(imageView.frame.size, NO, 0);
    
    [path addClip];
    
    // 绘制图片
    [textImage drawInRect:imageView.frame];
    
    // 获取当前图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    
    UIGraphicsEndImageContext();
    
    imageView.image = image;
    
    [self.view addSubview:imageView];
}


@end
