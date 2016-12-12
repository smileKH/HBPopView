//
//  HBPopView.m
//  HBPopView
//
//  Created by aplle on 2016/12/12.
//  Copyright © 2016年 mingboJob. All rights reserved.
//

#import "HBPopView.h"
#define SCREEN_WIDTH            ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT           ([[UIScreen mainScreen] bounds].size.height)
@interface HBPopView()
//主要的Windows
@property (nonatomic, strong) UIWindow *backWindow;
//黑色的view
@property (nonatomic , strong)UIView * drakView;
//白色的view
@property (nonatomic, strong) UIView *bottomView;
//取消button
@property (nonatomic , strong)UIButton * cancelButton;
@end
@implementation HBPopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 暗黑色的view
        UIView *darkView = [[UIView alloc] init];
        [darkView setAlpha:0];
        [darkView setUserInteractionEnabled:NO];
        [darkView setFrame:(CGRect){0, 0, SCREEN_WIDTH,SCREEN_HEIGHT}];
        [darkView setBackgroundColor:[UIColor grayColor]];
        [self addSubview:darkView];
        self.drakView = darkView;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
        [darkView addGestureRecognizer:tap];
        
        // 所有按钮的底部view
        UIView *bottomView = [[UIView alloc] init];
        [bottomView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:bottomView];
        _bottomView = bottomView;
        
        [bottomView setFrame:CGRectMake(40, SCREEN_HEIGHT, SCREEN_WIDTH-80, SCREEN_HEIGHT/2)];
        
        //加一个取消的按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor redColor];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        self.cancelButton = button;
        
        [button setFrame:CGRectMake(SCREEN_WIDTH-40-40, -40, 40, 40)];
        
        
        [self setFrame:(CGRect){0, 0, SCREEN_WIDTH,SCREEN_HEIGHT}];
        [self.backWindow addSubview:self];
        
    }
    return self;
}
-(void)clickButton:(UIButton *)button{
    
    [self dismiss];
}
- (UIWindow *)backWindow {
    
    if (_backWindow == nil) {
        
        _backWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backWindow.windowLevel       = UIWindowLevelStatusBar;
        _backWindow.backgroundColor   = [UIColor clearColor];
        _backWindow.hidden = NO;
    }
    
    return _backWindow;
}
- (void)dismiss:(UITapGestureRecognizer *)tap {
    
    [self dismiss];
}

-(void)dismiss{
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         [self.drakView setAlpha:0];
                         [self.drakView setUserInteractionEnabled:NO];
                         
                         CGRect frame = _bottomView.frame;
                         frame.origin.y = SCREEN_HEIGHT;
                         [_bottomView setFrame:frame];
                         
                         CGRect cancelFrame = _cancelButton.frame;
                         cancelFrame.origin.y = -40;
                         [_cancelButton setFrame:cancelFrame];
                         
                     }
                     completion:^(BOOL finished) {
                         
                         _backWindow.hidden = YES;
                         
                         [self removeFromSuperview];
                     }];
    
    
}


- (void)show {
    
    _backWindow.hidden = NO;
    
    [UIView animateWithDuration:.75f
                          delay:0.2
         usingSpringWithDamping:0.65f
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.drakView setAlpha:0.4f];
                         [self.drakView setUserInteractionEnabled:YES];
                         
                         CGRect frame = _bottomView.frame;
                         frame.origin.y = (SCREEN_HEIGHT-frame.size.height)/2;
                         [_bottomView setFrame:frame];
                         
                         CGRect cancelFrame = _cancelButton.frame;
                         cancelFrame.origin.y = frame.origin.y/2;
                         [_cancelButton setFrame:cancelFrame];
                     }
                     completion:^(BOOL finished) {
                         
                         
                     }];
}


@end
