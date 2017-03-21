//
//  ViewController.m
//  SSYCycleProgress
//
//  Created by 邵仕宇 on 2017/3/21.
//  Copyright © 2017年 punch. All rights reserved.
//

#import "ViewController.h"
#import "SSYCycleView.h"        //**自定义view*/

@interface ViewController ()

@property (nonatomic , strong)SSYCycleView *cycleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
    
}

- (void)createUI {
    [self.view addSubview:self.cycleView];
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(self.cycleView.frame.origin.x - 20, self.cycleView.frame.origin.y + self.cycleView.frame.size.height + 50, self.cycleView.frame.size.width + 40, 20)];
    [self.view addSubview:slider];
    
    //添加方法
    [slider addTarget:self action:@selector(sliderChangeMethod:) forControlEvents:UIControlEventValueChanged];
}

- (void)sliderChangeMethod:(UISlider *)sender {
    self.cycleView.progressLabel.text = [NSString stringWithFormat:@"%.2f%%", sender.value*100];
    self.cycleView.progress = sender.value;
}

#pragma mark ----------- 懒加载 -----------

- (SSYCycleView *)cycleView {
    if (_cycleView == nil) {
        _cycleView = [[SSYCycleView alloc]initWithFrame:CGRectMake(90, 100, 200, 200)];
        _cycleView.backgroundColor = [UIColor whiteColor];
    }
    return _cycleView;
}

@end
