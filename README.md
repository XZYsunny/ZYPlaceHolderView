# ZYPlaceHolderView
直接在UIViewController调用 [self zy_checkEmpty:@"枚举：占位图类型" superView:self.view];
然后在代理方法内做需要的操作
- (void)emptyOverlayClicked:(id)sender {
    NSLog(@"刷新页面");
}

![](http://p1.bqimg.com/567571/8eb705ad0b6fb0bb.png)
