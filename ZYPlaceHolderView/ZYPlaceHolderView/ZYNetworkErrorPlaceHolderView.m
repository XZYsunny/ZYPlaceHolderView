//
//  ZYNetworkErrorPlaceHolderView.m
//  ZYPlaceHolderView
//
//  Created by sunny on 2017/3/15.
//  Copyright © 2017年 sunny. All rights reserved.
//

#define NO_WIFI_WORDS                   @"网络不太顺畅"

float const width_displayNoWifiView  = 86.0 ;
float const height_displayNoWifiView = 52.5 ;

float const height_labelshow         = 35.0 ;
float const fontSize_labelshow       = 14.0 ;

float const flexY_lb_bt              = 10.0 ;

float const width_bt                 = 100.0 ;
float const height_bt                = 30.0 ;
float const fontSize_bt              = 13.0 ;


#import "ZYNetworkErrorPlaceHolderView.h"

@interface ZYNetworkErrorPlaceHolderView ()

@property (nonatomic, strong) UIImageView *nowifiImgView ;
@property (nonatomic, strong) UILabel *tipLabel ;
@property (nonatomic, strong) UIButton *reloadBtn ;

@end

@implementation ZYNetworkErrorPlaceHolderView
- (void)showInView:(UIView *)viewWillShow {
    [viewWillShow addSubview:self] ;
}

- (void)dismiss {
    [self removeFromSuperview] ;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews] ;
    
    self.nowifiImgView.frame = CGRectMake((self.frame.size.width - width_displayNoWifiView) / 2.0f, (self.frame.size.height - height_displayNoWifiView - height_labelshow  - height_bt) / 2.0, width_displayNoWifiView, height_displayNoWifiView) ;
    self.tipLabel.frame = CGRectMake(0, CGRectGetMaxY(self.nowifiImgView.frame), self.frame.size.width, height_labelshow) ;
    self.reloadBtn.frame = CGRectMake((self.frame.size.width - width_bt) / 2.0f,  CGRectGetMaxY(self.tipLabel.frame), width_bt, height_bt) ;
}

- (void)setup {
    [self configure] ;
    [self nowifiImgView] ;
    [self tipLabel] ;
    [self reloadBtn] ;
}

- (void)configure {
    self.backgroundColor = [UIColor whiteColor] ;
}

- (UIImageView *)nowifiImgView {
    if (!_nowifiImgView) {
        _nowifiImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"no-wifi"]] ;
        _nowifiImgView.contentMode = UIViewContentModeScaleAspectFit ;
        if (![_nowifiImgView superview]) {
            [self addSubview:_nowifiImgView] ;
        }
    }
    return _nowifiImgView ;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init] ;
        _tipLabel.text = NO_WIFI_WORDS ;
        _tipLabel.font = [UIFont systemFontOfSize:fontSize_labelshow] ;
        _tipLabel.textAlignment = NSTextAlignmentCenter ;
        _tipLabel.textColor = [UIColor lightGrayColor] ;
        if (![_tipLabel superview]) {
            [self addSubview:_tipLabel] ;
        }
    }
    return _tipLabel ;
}

- (UIButton *)reloadBtn {
    if (!_reloadBtn) {
        _reloadBtn = [[UIButton alloc] init] ;
        [_reloadBtn setTitle:@"重新加载" forState:UIControlStateNormal] ;
        [_reloadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal] ;
        _reloadBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize_bt] ;
        _reloadBtn.layer.cornerRadius = 15.0f ;
        //        _reloadBtn.layer.borderWidth = 1.0f ;
        //        _reloadBtn.layer.borderColor = [UIColor darkGrayColor].CGColor ;
        [_reloadBtn setBackgroundColor:[UIColor colorWithRed:(255/255.0) green:(85/255.0) blue:(85/255.0) alpha:1]];
        [_reloadBtn addTarget:self action:@selector(reloadButtonClicked:) forControlEvents:UIControlEventTouchUpInside] ;
        if (![_reloadBtn superview]) {
            [self addSubview:_reloadBtn] ;
        }
    }
    return _reloadBtn ;
}

- (void)reloadButtonClicked:(UIButton *)sender {
    if ([self.networkDelegate respondsToSelector:@selector(emptyOverlayClicked:)]) {
        [self.networkDelegate emptyOverlayClicked:sender];
    }
}

@end
