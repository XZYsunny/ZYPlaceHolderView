//
//  ZYNorecordPlaceHolderView.h
//  ZYPlaceHolderView
//
//  Created by sunny on 2017/3/15.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ZYPlaceHolderView.h"

@protocol ZYNorecordPlaceHolderViewDelegate <NSObject>

@required
- (void)emptyOverlayClicked:(id)sender;

@end

@interface ZYNorecordPlaceHolderView : ZYPlaceHolderView
@property (nonatomic, assign) id<ZYNorecordPlaceHolderViewDelegate> norecordelegate;
@end
