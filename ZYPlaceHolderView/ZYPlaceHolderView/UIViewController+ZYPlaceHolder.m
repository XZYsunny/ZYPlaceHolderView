//
//  UIViewController+ZYPlaceHolder.m
//  ZYPlaceHolderView
//
//  Created by sunny on 2017/3/15.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "UIViewController+ZYPlaceHolder.h"
#import <objc/runtime.h>

@interface UIViewController ()
@property (nonatomic, strong) ZYPlaceHolderView *placeHolderView;
@end

@implementation UIViewController (ZYPlaceHolder)

- (UIView *)placeHolderView {
    return objc_getAssociatedObject(self, @selector(placeHolderView));
}

- (void)setPlaceHolderView:(UIView *)placeHolderView {
    objc_setAssociatedObject(self, @selector(placeHolderView), placeHolderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)zy_checkEmpty:(ZYPlaceHolder)status superView:(UIView *)superView{
    BOOL isShow = YES;
    if (status == ZYPlaceHolderNone) {
        isShow = NO;
    }
    if (!isShow != !self.placeHolderView) {
        if (isShow) {
            if (self.placeHolderView.placeHolderType == status) {
                [self.placeHolderView removeFromSuperview];
                [superView addSubview:self.placeHolderView];
            }else{
                if ([superView respondsToSelector:@selector(isScrollEnabled)]) {
                    ((UIScrollView *)superView).scrollEnabled = NO;
                }
                if ([self respondsToSelector:@selector(makePlaceHolderView:SuperView:)]) {
                    self.placeHolderView = [self performSelector:@selector(makePlaceHolderView:SuperView:) withObject:[NSNumber numberWithInteger:status] withObject:superView];
                } else {
                    NSString *selectorName = NSStringFromSelector(_cmd);
                    NSString *reason = [NSString stringWithFormat:@"You must implement makePlaceHolderView method in your custom view or its delegate class if you want to use %@", selectorName];
                    @throw [NSException exceptionWithName:NSGenericException
                                                   reason:reason
                                                 userInfo:nil];
                }
                self.placeHolderView.frame = CGRectMake(0, 0, superView.frame.size.width, superView.frame.size.height);
                [superView addSubview:self.placeHolderView];
            }
        } else {
            [self.placeHolderView removeFromSuperview];
            self.placeHolderView = nil;
        }
    } else if (isShow) {
        if (self.placeHolderView.placeHolderType == status) {
            [self.placeHolderView removeFromSuperview];
            [superView addSubview:self.placeHolderView];
        }else{
            [self.placeHolderView removeFromSuperview];
            if ([superView respondsToSelector:@selector(isScrollEnabled)]) {
                ((UIScrollView *)superView).scrollEnabled = NO;
            }
            if ([self respondsToSelector:@selector(makePlaceHolderView:SuperView:)]) {
                self.placeHolderView = [self performSelector:@selector(makePlaceHolderView:SuperView:) withObject:[NSNumber numberWithInteger:status] withObject:superView];
            } else {
                NSString *selectorName = NSStringFromSelector(_cmd);
                NSString *reason = [NSString stringWithFormat:@"You must implement makePlaceHolderView method in your custom view or its delegate class if you want to use %@", selectorName];
                @throw [NSException exceptionWithName:NSGenericException
                                               reason:reason
                                             userInfo:nil];
            }
            self.placeHolderView.frame = CGRectMake(0, 0, superView.frame.size.width, superView.frame.size.height);
            [superView addSubview:self.placeHolderView];
        }
    }
}
#pragma mark - createPlaceHolder Method
- (UIView *)makePlaceHolderView:(NSNumber *)status SuperView:(UIView *)superView{
    NSLog(@"%@",status);
    ZYPlaceHolder placeHolder = [status integerValue];
    if (placeHolder == ZYPlaceHolderNorecord) {
        return [self norecordPlaceHolderWithSuperView:superView];
    }else if (placeHolder == ZYPlaceHolderNetWorkError){
        return [self networkPlaceHolderWithSuperView:superView];
    }
    return nil;
}
//// 此处可以自定义placeHolderView
- (UIView *)norecordPlaceHolderWithSuperView:(UIView *)superView{
    ZYNorecordPlaceHolderView *norecord = [[ZYNorecordPlaceHolderView alloc] initWithFrame:superView.bounds];
    norecord.norecordelegate = self;
    return norecord;
}

- (UIView *)networkPlaceHolderWithSuperView:(UIView *)superView{
    ZYNetworkErrorPlaceHolderView *network = [[ZYNetworkErrorPlaceHolderView alloc] initWithFrame:superView.bounds];
    network.networkDelegate = self;
    return network;
}

#pragma mark - placeHolderDelegate Method

/// 需要做刷新页面的需要重写
- (void)emptyOverlayClicked:(id)sender {
    
}
@end
