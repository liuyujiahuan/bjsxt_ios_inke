//
//  SXTMainTopView.h
//  尚学堂映客
//
//  Created by 大欢 on 16/8/24.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);

@interface SXTMainTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles tapView:(MainTopBlock)block;

- (void)scrolling:(NSInteger)tag;

@end
