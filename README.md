# GBClipImage
iOS开发 ／UIImage(图片裁剪)／UIView裁剪
需求是需要上面圆弧效果
️PS：用贝塞尔曲线实现圆弧效果涉及到轻微的高中几何知识...
可以自行百度，其实只需要求出半径....
![图片发自简书App](//upload-images.jianshu.io/upload_images/2376772-89e22e28f4da3c94.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)

######一、这是UIImage用贝塞尔曲线裁剪的效果：
![image.png](http://upload-images.jianshu.io/upload_images/2376772-0f9991b44585e0b6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/240)
######代码实现
```
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
```

######二、这是UIView用贝塞尔曲线裁剪的效果：
![image.png](http://upload-images.jianshu.io/upload_images/2376772-41db279d3170030b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/240)
######代码实现
```
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
```
