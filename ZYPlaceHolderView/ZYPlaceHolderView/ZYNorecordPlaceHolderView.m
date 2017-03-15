//
//  ZYNorecordPlaceHolderView.m
//  ZYPlaceHolderView
//
//  Created by sunny on 2017/3/15.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYNorecordPlaceHolderView.h"

@interface ZYNorecordPlaceHolderView ()
@property (nonatomic, strong) UIImageView *emptyOverlayImageView;

@end

@implementation ZYNorecordPlaceHolderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}

- (instancetype)sharedInit {
    self.backgroundColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor whiteColor];
    self.contentMode =   UIViewContentModeTop;
    [self addUIemptyOverlayImageView];
    [self addUIemptyOverlayLabel];
    [self setupUIemptyOverlay];
    return self;
}

- (void)addUIemptyOverlayImageView {
    self.emptyOverlayImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.emptyOverlayImageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2 - 30);
    self.emptyOverlayImageView.image = [UIImage imageNamed:@"WebView_LoadFail_Refresh_Icon"];
    [self addSubview:self.emptyOverlayImageView];
}

- (void)addUIemptyOverlayLabel {
    CGRect emptyOverlayViewFrame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 20);
    UILabel *emptyOverlayLabel = [[UILabel alloc] initWithFrame:emptyOverlayViewFrame];
    emptyOverlayLabel.textAlignment = NSTextAlignmentCenter;
    emptyOverlayLabel.numberOfLines = 0;
    emptyOverlayLabel.backgroundColor = [UIColor clearColor];
    emptyOverlayLabel.text = @"暂无数据,轻触屏幕重新加载";
    emptyOverlayLabel.font = [UIFont systemFontOfSize:15];
    emptyOverlayLabel.frame = ({
        CGRect frame = emptyOverlayLabel.frame;
        frame.origin.y = CGRectGetMaxY(self.emptyOverlayImageView.frame) + 10;
        frame;
    });
    emptyOverlayLabel.textColor = [UIColor grayColor];
    [self addSubview:emptyOverlayLabel];
}

- (void)setupUIemptyOverlay {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPressUIemptyOverlay = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressUIemptyOverlay:)];
    [longPressUIemptyOverlay setMinimumPressDuration:0.001];
    [self addGestureRecognizer:longPressUIemptyOverlay];
    self.userInteractionEnabled = YES;
}

- (void)longPressUIemptyOverlay:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.emptyOverlayImageView.alpha = 0.4;
    }
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        self.emptyOverlayImageView.alpha = 1;
        if ([self.norecordelegate respondsToSelector:@selector(emptyOverlayClicked:)]) {
            [self.norecordelegate emptyOverlayClicked:nil];
        }
    }
}
@end
