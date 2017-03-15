//
//  ZYPlaceHolderView.h
//  ZYPlaceHolderView
//
//  Created by sunny on 2017/3/15.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , ZYPlaceHolder) {
    ZYPlaceHolderNone,
    ZYPlaceHolderNorecord,  /// 没有记录
    ZYPlaceHolderNetWorkError /// 网络不好
};

@interface ZYPlaceHolderView : UIView
/// placeHolderType 做标记，防止多次创建相同的placeHolder
@property (nonatomic, assign) ZYPlaceHolder placeHolderType;
@end
