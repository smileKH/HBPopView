//
//  ViewController.m
//  HBPopView
//
//  Created by aplle on 2016/12/12.
//  Copyright © 2016年 mingboJob. All rights reserved.
//

#import "ViewController.h"
#import "HBPopView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 50);
    button.center = self.view.center;
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)clickButton:(UIButton *)button{
    
    HBPopView *popView = [[HBPopView alloc]init];
    [popView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
