//
//  SXTNearLiveCell.h
//  尚学堂映客
//
//  Created by 大欢 on 16/8/25.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXTLive.h"

@interface SXTNearLiveCell : UICollectionViewCell

@property (nonatomic, strong) SXTLive * live;

- (void)showAnimation;

@end
