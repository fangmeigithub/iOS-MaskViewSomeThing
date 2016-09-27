//
//  ShowViewControllerTwo.m
//  Dome
//
//  Created by liubaojian on 16/9/27.
//  Copyright © 2016年 liubaojian. All rights reserved.
//

#import "ShowViewControllerTwo.h"


#define HEIGHT                   [UIScreen mainScreen].bounds.size.height
#define WIDTH                    [UIScreen mainScreen].bounds.size.width

@interface ShowViewControllerTwo ()
{
    NSInteger count;
}
@property (nonatomic,strong)UIImageView *grayImageV;
@property (nonatomic,strong)UIImageView *colorImageV;
@property (nonatomic,strong)UIView *maskView;
@end


static const NSInteger horizontalCount = 20;
static const NSInteger verticalCount = 3;

@implementation ShowViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.grayImageV];
    [self.view addSubview:self.colorImageV];
    [self setSubMaskView];
   
}
- (void)setSubMaskView
{
    
    const CGFloat fadeWidth = CGRectGetWidth(self.maskView.frame) / horizontalCount;
    const CGFloat fadeHeight = CGRectGetHeight(self.maskView.frame) / verticalCount;
    for (NSInteger line = 0; line < horizontalCount; line ++) {
        for (NSInteger row = 0; row < verticalCount; row++) {
            CGRect frame = CGRectMake(line*fadeWidth, row*fadeHeight, fadeWidth, fadeHeight);
            UIView * fadeView = [[UIView alloc] initWithFrame: frame];
            fadeView.tag =  line*verticalCount+row+100;
            fadeView.backgroundColor = [UIColor whiteColor];
            [self.maskView addSubview: fadeView];
        }
    }
   self.colorImageV.maskView = self.maskView;
}
- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:YES];
    [self animationFromLeft];
}

- (UIImageView *)grayImageV
{
    if (!_grayImageV) {
        //灰色背景
        UIImageView *grayImageV =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,WIDTH,HEIGHT)];
        grayImageV.image = [UIImage  imageNamed:@"1.jpeg"];
        grayImageV.backgroundColor = [UIColor clearColor];
        _grayImageV = grayImageV;
    }
   
    return _grayImageV;
}
- (UIImageView *)colorImageV
{
    if (!_colorImageV) {
        //彩色的背景
        UIImageView *colorImageV =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,WIDTH,HEIGHT)];
        colorImageV.image = [UIImage  imageNamed:@"2.jpeg"];
        colorImageV.backgroundColor = [UIColor clearColor];
        _colorImageV = colorImageV;
    }
  
    return _colorImageV;
}
- (UIView *)maskView
{
    if (!_maskView) {
        UIView * maskView = [[UIView alloc] initWithFrame: self.colorImageV.frame];
        //maskView.backgroundColor = [UIColor whiteColor];
        _maskView = maskView;
    }
    return _maskView;
}
- (void)animationFromLeft
{
    __weak typeof(self)weakSelf = self;
    for (NSInteger line = 0; line < horizontalCount; line ++) {
        for (NSInteger row = 0; row < verticalCount; row++) {
            NSInteger idx = line*verticalCount+row;
            UIView * fadeView = [self.maskView viewWithTag: idx+100];
            //delay  效果的关键，因为代码执行的很快，而效果要慢慢出来。（由小变大）
            [UIView animateWithDuration: 0.7 delay: 0.8*0.25*idx options: UIViewAnimationOptionCurveLinear animations: ^{
                fadeView.alpha = 0;
            } completion:^(BOOL finished) {
                 count ++;
                if (count == 60) {
                    [weakSelf animationFromRight];
                }
            }];
        }
    }
}
- (void)animationFromRight
{
    __weak typeof(self)weakSelf = self;
    for (NSInteger line = 0; line < horizontalCount; line ++) {
        for (NSInteger row = 0; row < verticalCount; row++) {
            NSInteger idx = 59-line*verticalCount-row;
            UIView * fadeView = [self.maskView viewWithTag: idx+100];
            //此处由右往左，所以delay （要由小变大）
            [UIView animateWithDuration: 0.7 delay: 0.8*0.25*(44-idx) options: UIViewAnimationOptionCurveLinear animations: ^{
                fadeView.alpha = 1;
            } completion:^(BOOL finished) {
                 count --;
                if (count == 0) {
                    [weakSelf animationFromLeft];
                }
            }];

        }
    }
}





@end
