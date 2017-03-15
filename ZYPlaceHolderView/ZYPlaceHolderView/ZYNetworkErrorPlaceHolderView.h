//
//  ZYNetworkErrorPlaceHolderView.h
//  ZYPlaceHolderView
//
//  Created by sunny on 2017/3/15.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYPlaceHolderView.h"

@protocol ZYNetworkErrorPlaceHolderViewDelegate <NSObject>

@required
- (void)emptyOverlayClicked:(id)sender;

@end

@interface ZYNetworkErrorPlaceHolderView : ZYPlaceHolderView
@property (nonatomic, assign) id<ZYNetworkErrorPlaceHolderViewDelegate> networkDelegate;

- (void)showInView:(UIView *)viewWillShow ;
- (void)dismiss ;
@end
