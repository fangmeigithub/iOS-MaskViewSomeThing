//
//  ShowViewControllerOne.m
//  Dome
//
//  Created by liubaojian on 16/9/27.
//  Copyright © 2016年 liubaojian. All rights reserved.
//

#import "ShowViewControllerOne.h"


#define HEIGHT                   [UIScreen mainScreen].bounds.size.height
#define WIDTH                    [UIScreen mainScreen].bounds.size.width

@interface ShowViewControllerOne ()
{
    CALayer *color_maskLayer;
    UIView *color_maskV;
}
@end

@implementation ShowViewControllerOne

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //灰色背景
    UIImageView *grayImageV =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,WIDTH,HEIGHT)];
    grayImageV.image = [UIImage  imageNamed:@"jobs_gray"];
    grayImageV.backgroundColor = [UIColor clearColor];
    [self.view addSubview:grayImageV];
    
    //彩色的背景
    UIImageView *colorImageV =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,WIDTH,HEIGHT)];
    colorImageV.image = [UIImage  imageNamed:@"jobs_color"];
    colorImageV.backgroundColor = [UIColor clearColor];
    [self.view addSubview:colorImageV];
    
    
//        color_maskV = [[UIView alloc]initWithFrame:CGRectMake(50, 30, 140, 140)];
//        color_maskV.backgroundColor = [UIColor whiteColor];
//        color_maskV.layer.cornerRadius = 70;
//        colorImageV.maskView = color_maskV;
    
    //为了显示区域的边缘有羽化的效果。使用的填充了内容的layer（形成想要的展示区域）
    color_maskLayer = [CALayer layer];
    color_maskLayer.frame = CGRectMake(50, 30, 240, 240);
    color_maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"mask_image"].CGImage) ; //使用图片填充
    color_maskLayer.position = CGPointMake(200, 100);
    colorImageV.layer.mask = color_maskLayer;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint poinit = [touch locationInView:self.view];
    color_maskLayer.position = poinit;
//    color_maskV.center = poinit;
}

@end
