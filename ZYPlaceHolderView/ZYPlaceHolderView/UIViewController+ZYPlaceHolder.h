//
//  UIViewController+ZYPlaceHolder.h
//  ZYPlaceHolderView
//
//  Created by sunny on 2017/3/15.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYNorecordPlaceHolderView.h"
#import "ZYNetworkErrorPlaceHolderView.h"

@interface UIViewController (ZYPlaceHolder)
- (void)zy_checkEmpty:(ZYPlaceHolder)status superView:(UIView *)superView;

@end
