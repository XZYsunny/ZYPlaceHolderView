//
//  ViewController.m
//  ZYPlaceHolderView
//
//  Created by sunny on 2017/3/15.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+ZYPlaceHolder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSInteger index =  arc4random_uniform(3);
    NSLog(@"index : %ld",(long)index);
    ///  在需要添加占位图的地方调用
    [self zy_checkEmpty:index superView:self.view];
}
#pragma mark - placeHolderDelegate
/// 刷新页面回调
- (void)emptyOverlayClicked:(id)sender {
    NSLog(@"刷新页面");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
