//
//  ViewController.m
//  裁剪
//
//  Created by apple on 16/7/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     把正方形的图片进行裁切然后生成一张圆形的图片。
     */
    
    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    
    /**
     1、创建一个与图片大小相同的基于位图(bitmap)的图形上下文：可以把图形上下文看成是一个画板，以后所绘制的内容都画在这个画板上。
     size参数：图形上下文的尺寸；
     opaque参数：不透明度（YES：不透明；NO：透明）；
     scale参数：缩放比例。
     */
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    /**
     2、绘制一个圆形区域，将来把图片放到这个圆形区域上，在圆形区域内的保留，超过这个圆形区域的裁切掉。
     */
    
    //2.1 用贝塞尔路径画圆：确定一个矩形范围，在这个矩形范围内画圆。
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    //2.2 把上述的路径设为裁剪区域：
    [path addClip];
    
    /**
     3、在图像上下文中绘制图片：
     */
    [image drawAtPoint:CGPointZero];
    
    /**
     4、从图形上下文中取出剪切完成的图片：
     */
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    
    /**
     5、关闭图形上下文：
     */
    UIGraphicsEndImageContext();
    
    /**
     6、把裁切好的图片显示到UIImageView控件上面：
     */
    self.imageView.image = clipImage;
}

@end
