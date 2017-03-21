//
//  SSYCycleView.m
//  SSYCycleProgress
//
//  Created by 邵仕宇 on 2017/3/21.
//  Copyright © 2017年 punch. All rights reserved.
//

#import "SSYCycleView.h"

@interface SSYCycleView()

@property (nonatomic , strong)CAShapeLayer *progressLayer;//*layer*/

@end

@implementation SSYCycleView

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    self.progressLayer.opacity = 0;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    CGFloat radius = 90;
    CGFloat start  = - M_PI_2; //设置起点
    CGFloat end    = - M_PI_2 + M_PI * 2 * self.progress;//设置终点
    
    //画一个圆，填充色透明，设置边框带颜色，就是一个圆环
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.frame = self.bounds;
    self.progressLayer.fillColor = [UIColor clearColor].CGColor; //填充颜色
    self.progressLayer.strokeColor = [UIColor greenColor].CGColor; //path填充的颜色，即圆环的颜色
    self.progressLayer.lineCap = kCALineCapRound;//线边缘是圆形
    self.progressLayer.lineWidth = 10;
    
    //用贝塞尔曲线画圆
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    self.progressLayer.path = [bezierPath CGPath];
    [self.layer addSublayer:self.progressLayer];
    
    //添加渐变色
    
    CALayer *layer = [CALayer layer];
    
    CAGradientLayer *rightLayer = [CAGradientLayer layer];
    rightLayer.frame = CGRectMake(self.frame.size.width / 2, 0, self.frame.size.width / 2, self.frame.size.height);
    rightLayer.locations = @[@0.1,@0.8,@1];
    rightLayer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor yellowColor].CGColor,(id)[UIColor greenColor].CGColor];
    [layer addSublayer:rightLayer];
    
    CAGradientLayer *leftLayer = [CAGradientLayer layer];
    leftLayer.frame = CGRectMake(0, 0, self.frame.size.width / 2, self.frame.size.height);
    leftLayer.locations = @[@0.1,@0.8,@1];
    leftLayer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor yellowColor].CGColor,(id)[UIColor greenColor].CGColor];
    [layer addSublayer:leftLayer];
    
    [layer setMask:self.progressLayer];
    [self.layer addSublayer:layer];
    
}

#pragma mark ----------- 懒加载 -----------

- (UILabel *)progressLabel {
    if (_progressLabel == nil) {
        _progressLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _progressLabel.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_progressLabel];
    }
    return _progressLabel;
}



@end
